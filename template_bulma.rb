require 'fileutils'
require 'shellwords'

def add_template_repository_to_source_path
  if __FILE__ =~ %r{\Ahttps?://}
    require 'tmpdir'
    source_paths.unshift(tempdir = Dir.mktmpdir('rails-'))
    at_exit { FileUtils.remove_entry(tempdir) }
    git clone: [
      '--quiet',
      'https://github.com/IsraelDCastro/rails-vite-tailwindcss-template.git',
      tempdir
    ].map(&:shellescape).join(' ')

    if (branch = __FILE__[%r{rails-vite-tailwindcss-template/(.+)/template_bulma.rb}, 1])
      Dir.chdir(tempdir) { git checkout: branch }
    end
  else
    source_paths.unshift(File.dirname(__FILE__))
  end
end

def add_gems
  gem 'vite_rails'
  gem 'vite_ruby'
  gem 'image_processing', '~> 1.2'
  gem 'annotate', group: :development
end

def set_application_name
  # Add Application Name to Config
  environment 'config.application_name = Rails.application.class.module_parent_name'

  # Announce the user where they can change the application name in the future.
  puts 'You can change application name inside: ./config/application.rb'
end

def add_vite
  run 'bundle exec vite install'
end

def add_javascript_vue
  run 'yarn add bulma sass vite vue'
  run 'yarn add -D @vitejs/plugin-vue @vue/compiler-sfc eslint eslint-plugin-vue path vite-plugin-full-reload vite-plugin-ruby'
end

def add_javascript_react
  run 'yarn add bulma sass vite react react-dom'
  run 'yarn add -D @vitejs/plugin-react-refresh eslint eslint-plugin-vue path vite-plugin-full-reload vite-plugin-ruby'
end

def copy_templates

  copy_file 'Procfile.dev', force: true
  copy_file 'jsconfig.json', force: true
  copy_file '.eslintrc.json'

  # directory "bulma/app", "app", force: true
  # directory "bulma/lib", "lib", force: true

  say 'Remove bulma directory from template.', :red
  run "rm -rf #{app_name}/bulma"
end

def add_pages_controller
  generate 'controller Pages home'
  route "root to: 'pages#home'"
end

def run_command_flags
  ARGV.each do |flag|
    # process arguments like so
    copy_file 'vite.config-react.ts', 'vite.config.ts' if flag == '--react'
    directory 'bulma-react/app', 'app', force: true if flag == '--react'
    inject_into_file('.eslintrc.json', "\n" '    "react"', after: '"plugins": [') if flag == '--react'
    add_javascript_react if flag == '--react'

    copy_file 'vite.config-vue.ts', 'vite.config.ts' if flag == '--vue'
    directory 'bulma-vue/app', 'app', force: true if flag == '--vue'
    inject_into_file('.eslintrc.json', "\n" '    "vue"', after: '"plugins": [') if flag == '--vue'
    add_javascript_vue if flag == '--vue'
  end
end

# Main setup

add_gems

after_bundle do
  add_template_repository_to_source_path
  set_application_name
  add_pages_controller
  copy_templates

  run_command_flags

  add_vite
  rails_command 'db:create'
  rails_command 'active_storage:install'

  # rails_command "db:migrate"
  # Commit everything to git
  begin
    git add: ('.')
    git commit: %( -m 'Initial commit' )
  rescue StandardError => e
    puts e.message
  end

  say

  ARGV.each do |flag|
    say 'Rails 7 + Vue 3 + ViteJS + Bulma created!', :green if flag == '--vue'
    say 'Rails 7 + ReactJS 18 + ViteJS + Bulma created!', :green if flag == '--react'
  end

  say
  say '  To get started with your new app:', :yellow
  say "  cd #{app_name}"
  say '  # If bulma directory is inside your project, be sure'
  say '  # To delete it, it does not affect your project.'
  say '  # Please update config/database.yml with your database credentials'
  say
  say '  rails s'
end