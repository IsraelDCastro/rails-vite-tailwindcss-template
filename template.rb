# frozen_string_literal: true

require 'fileutils'
require 'shellwords'

# Flags helpers
def skip_devise?
  ARGV.include?('--skip-devise')
end

def skip_active_storage?
  ARGV.include?('--skip-active-storage')
end

# Package manager helpers (default: bun). Use --package-manager=bun|yarn|npm|pnpm
def selected_package_manager
  pm_flag = ARGV.find { |f| f.start_with?('--package-manager=') }
  value = pm_flag && pm_flag.split('=', 2)[1]
  %w[bun yarn npm pnpm].include?(value) ? value : 'bun'
end

def pm_install
  case selected_package_manager
  when 'bun' then 'bun install'
  when 'yarn' then 'yarn'
  when 'npm' then 'npm install'
  when 'pnpm' then 'pnpm install'
  end
end

def pm_add(packages)
  case selected_package_manager
  when 'bun' then "bun add #{packages}"
  when 'yarn' then "yarn add #{packages}"
  when 'npm' then "npm install #{packages}"
  when 'pnpm' then "pnpm add #{packages}"
  end
end

def pm_add_dev(packages)
  case selected_package_manager
  when 'bun' then "bun add -d #{packages}"
  when 'yarn' then "yarn add -D #{packages}"
  when 'npm' then "npm install -D #{packages}"
  when 'pnpm' then "pnpm add -D #{packages}"
  end
end

# Resolve Vite config filename (.ts or .mts)
def vite_config_path
  %w[vite.config.ts].find { |p| File.exist?(p) } || 'vite.config.ts'
end

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
  gem 'ruby-vips', '~> 2.1', '>= 2.1.4' unless skip_active_storage?
  gem 'annotate', group: :development
  gem 'devise' unless skip_devise?
  gem 'name_of_person' unless skip_devise?
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
  run pm_add('tailwindcss vite')
  run pm_add_dev('eslint prettier eslint-plugin-prettier eslint-config-prettier eslint-plugin-tailwindcss @tailwindcss/vite path vite-plugin-full-reload vite-plugin-ruby')
end

def add_javascript_vue
  run pm_add('tailwindcss vite vue')
  run pm_add_dev('@vitejs/plugin-vue @vue/compiler-sfc eslint prettier eslint-plugin-prettier eslint-config-prettier eslint-plugin-vue eslint-plugin-tailwindcss @tailwindcss/vite path vite-plugin-full-reload vite-plugin-ruby')
end

def add_javascript_react
  run pm_add('tailwindcss vite react react-dom')
  run pm_add_dev('@vitejs/plugin-react eslint prettier eslint-plugin-prettier eslint-config-prettier eslint-plugin-react eslint-plugin-tailwindcss @tailwindcss/vite path vite-plugin-full-reload vite-plugin-ruby')
end

def add_hotwired
  run pm_add('@hotwired/stimulus @hotwired/turbo-rails')
end

def copy_templates

  copy_file 'Procfile.dev'
  copy_file 'jsconfig.json'

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
    copy_file '.eslintrc-react-tailwind.json', '.eslintrc.json' if flag == '--react'
    directory 'app-react', 'app', force: true if flag == '--react'
    add_javascript_react if flag == '--react'

    copy_file 'vite.config-vue.ts', 'vite.config.ts' if flag == '--vue'
    copy_file '.eslintrc-vue-tailwind.json', '.eslintrc.json' if flag == '--vue'
    directory 'app-vue', 'app', force: true if flag == '--vue'
    add_javascript_vue if flag == '--vue'

    copy_file 'vite.config.ts' if flag == '--normal'
    copy_file '.eslintrc-tailwind.json', '.eslintrc.json' if flag == '--normal'
    directory 'app', force: true if flag == '--normal'
    add_javascript if flag == '--normal'

    directory 'hotwired-generator', 'lib/generators' if flag == '--hotwired'
    add_hotwired_gem if flag == '--hotwired'
    add_hotwired if flag == '--hotwired'

    if flag == '--hotwired'
      hotwired_inject = "import { Turbo } from \"@hotwired/turbo-rails\";\n\nwindow.Turbo = Turbo;\n\n"
      inject_into_file('app/frontend/entrypoints/application.js', hotwired_inject, before: 'import "./main.scss";')
    end

    # Tailwind CSS: add Vite plugin when using this template (Tailwind stack)
    if ['--react', '--vue', '--normal'].include?(flag)
      inject_into_file("vite.config.ts", "\nimport tailwindcss from \"@tailwindcss/vite\";", after: 'import RubyPlugin from "vite-plugin-ruby";')
    end
    if ['--react', '--vue', '--normal'].include?(flag)
      inject_into_file("vite.config.ts", "    tailwindcss(),\n    ", after: "plugins: [\n")
    end
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
  # Version files for reproducibility
  create_file '.node-version', "20\n"
  create_file '.ruby-version', "3.2.0\n"

  rails_command 'db:create'

  unless skip_devise?
    rails_command 'generate devise:install'
    rails_command 'generate devise user'
    rails_command 'generate migration AddNameFieldsToUser first_name last_name'
    inject_into_file('app/models/user.rb', "\n\n  has_person_name\n", after: ':validatable')
    permitted_params_block = <<~RUBY

      before_action :configure_permitted_parameters, if: :devise_controller?

      protected

      def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up) do |u|
          u.permit(:first_name, :last_name, :name, :email, :password)
        end

        devise_parameter_sanitizer.permit(:account_update) do |u|
          u.permit(:first_name, :last_name, :name, :email, :password, :password_confirmation, :current_password)
        end
      end
    RUBY
    inject_into_file('app/controllers/application_controller.rb', permitted_params_block, after: 'class ApplicationController < ActionController::Base')
  end

  unless skip_active_storage?
    rails_command 'active_storage:install'
    inject_into_file('config/application.rb', "\n\n" '    config.active_storage.variant_processor = :vips', after: 'config.load_defaults 7.0')
  end
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
    say 'Rails 7 + ReactJS 19 + ViteJS + Tailwindcss created!', :green if flag == '--react'
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
