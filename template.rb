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

def add_hotwired_gem
  gem 'stimulus-rails'
  gem 'turbo-rails'
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

def add_javascript
  run 'yarn add autoprefixer postcss sass tailwindcss vite'
  run 'yarn add -D eslint prettier eslint-plugin-prettier eslint-config-prettier path vite-plugin-full-reload vite-plugin-ruby'
end

def add_javascript_vue
  run 'yarn add autoprefixer postcss sass tailwindcss vite vue'
  run 'yarn add -D @vitejs/plugin-vue @vue/compiler-sfc eslint prettier eslint-plugin-prettier eslint-config-prettier eslint-plugin-vue path vite-plugin-full-reload vite-plugin-ruby'
end

def add_javascript_react
  run 'yarn add autoprefixer postcss sass tailwindcss vite react react-dom'
  run 'yarn add -D @vitejs/plugin-react-refresh eslint prettier eslint-plugin-prettier eslint-config-prettier eslint-plugin-react path vite-plugin-full-reload vite-plugin-ruby'
end

def add_hotwired
  run 'yarn add @hotwired/stimulus @hotwired/turbo-rails'
end

def copy_templates

  copy_file 'Procfile.dev'
  copy_file 'jsconfig.json'
  copy_file 'tailwind.config.js'
  copy_file 'postcss.config.js'

  # directory 'app', force: true
  directory 'config', force: true
  directory 'lib', force: true

  run 'for file in lib/templates/**/**/*.txt; do mv "$file" "${file%.txt}.tt"; done'
  say '  Custom scaffold templates copied', :green
end

def add_pages_controller
  generate 'controller Pages home'
  route "root to: 'pages#home'"
end

def run_command_flags
  ARGV.each do |flag|
    copy_file 'vite.config-react.ts', 'vite.config.ts' if flag == '--react'
    copy_file '.eslintrc-react.json', '.eslintrc.json' if flag == '--react'
    directory 'app-react', 'app', force: true if flag == '--react'
    add_javascript_react if flag == '--react'

    copy_file 'vite.config-vue.ts', 'vite.config.ts' if flag == '--vue'
    copy_file '.eslintrc-vue.json', '.eslintrc.json' if flag == '--vue'
    directory 'app-vue', 'app', force: true if flag == '--vue'
    add_javascript_vue if flag == '--vue'

    copy_file 'vite.config.ts' if flag == '--normal'
    copy_file '.eslintrc.json' if flag == '--normal'
    directory 'app', force: true if flag == '--normal'
    add_javascript if flag == '--normal'

    directory 'hotwired-generator', 'lib/generators' if flag == '--hotwired'
    add_hotwired_gem if flag == '--hotwired'
    add_hotwired if flag == '--hotwired'
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
  rails_command 'g annotate:install'
  rails_command 'db:migrate'

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
    say 'Rails 7 + ViteJS + Tailwindcss created!', :green if flag == '--normal'
    say 'Hotwired + Stimulus were added successfully', :green if flag == '--hotwired'
  end

  say
  say '  To get started with your new app:', :yellow
  say "  cd #{original_app_name}"
  say
  say '  # Please update config/database.yml with your database credentials'
  say
  say '  rails s'
end
