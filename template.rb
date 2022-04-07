# frozen_string_literal: true

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

    if (branch = __FILE__[%r{rails-vite-tailwindcss-template/(.+)/template.rb}, 1])
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
  run 'yarn add autoprefixer postcss sass tailwindcss vite vue'
  run 'yarn add -D @vitejs/plugin-vue @vue/compiler-sfc eslint eslint-plugin-tailwindcss eslint-plugin-vue path vite-plugin-full-reload vite-plugin-ruby'
end

def add_javascript_react
  run 'yarn add autoprefixer postcss sass tailwindcss vite react react-dom'
  run 'yarn add -D @vitejs/plugin-react-refresh eslint eslint-plugin-tailwindcss eslint-plugin-vue path vite-plugin-full-reload vite-plugin-ruby'
end

def copy_templates

  copy_file 'Procfile.dev'
  copy_file 'jsconfig.json'
  copy_file 'tailwind.config.js'
  copy_file 'postcss.config.js'

  # directory 'app', force: true
  directory 'config', force: true
  directory 'lib', force: true
end

def add_pages_controller
  generate 'controller Pages home'
  route "root to: 'pages#home'"
end

def run_command_flags
  ARGV.each do |flag|
    # process arguments like so
    copy_file 'vite.config-react.ts', 'vite.config.ts' if flag == '--react'
    copy_file '.eslintrc-react.json', '.eslintrc.json' if flag == '--react'
    directory 'app-react', 'app', force: true if flag == '--react'
    add_javascript_react if flag == '--react'

    copy_file 'vite.config-vue.ts', 'vite.config.ts' if flag == '--vue'
    copy_file '.eslintrc-vue.json', '.eslintrc.json' if flag == '--vue'
    directory 'app-vue', 'app', force: true if flag == '--vue'
    add_javascript_vue if flag == '--vue'
  end
end

# Main setup
add_gems
after_bundle do
  add_template_repository_to_source_path
  set_application_name
  add_pages_controller
  run_command_flags

  copy_templates
  add_vite

  rails_command 'db:create'
  rails_command 'active_storage:install'

  # remove_file 'app/views/pages/home.html.erb'
  #
  # copy_file 'app/views/pages/home.html.erb'

  begin
    git add: '.'
    git commit: %( -m 'Initial commit' )
  rescue StandardError => e
    puts e.message
  end

  say

  ARGV.each do |flag|
    say 'Rails 7 + Vue 3 + ViteJS + Tailwindcss created!', :green if flag == '--vue'
    say 'Rails 7 + ReactJS 18 + ViteJS + Tailwindcss created!', :green if flag == '--react'
  end

  say
  say 'To get started with your new app:', :yellow
  say "  cd #{app_name}"
  say
  say '  #Please update config/database.yml with your database credentials'
  say
  say '  rails s'
end
