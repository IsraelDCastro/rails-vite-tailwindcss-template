require "fileutils"
require "shellwords"

def add_gems
  gem 'vite_rails'
  gem 'vite_ruby'
  gem "image_processing", "~> 1.2"
  gem "annotate", group: [:development, :test]
end

def set_application_name
  # Add Application Name to Config
  environment "config.application_name = Rails.application.class.module_parent_name"

  # Announce the user where they can change the application name in the future.
  puts "You can change application name inside: ./config/application.rb"
end

def add_vite
  run 'bundle exec vite install'
  inject_into_file('vite.config.ts', "import FullReload from 'vite-plugin-full-reload'\n", after: %(from 'vite'\n))
  inject_into_file('vite.config.ts', "import StimulusHMR from 'vite-plugin-stimulus-hmr'\n", after: %(from 'vite'\n))
  inject_into_file('vite.config.ts', "\n    FullReload(['config/routes.rb', 'app/views/**/*']),", after: 'plugins: [')
end

def add_javascript
  run "yarn add autoprefixer postcss sass tailwindcss vite vue"
  run "yarn add -D @vitejs/plugin-vue @vue/compiler-sfc eslint eslint-plugin-tailwindcss eslint-plugin-vue path vite-plugin-full-reload vite-plugin-ruby yarn-upgrade-all"
end

def copy_templates
  # remove_file "app/frontend/entrypoints/application.js"
  # remove_file "app/frontend/components" # Webpack

  # copy_file "Procfile"
  copy_file "Procfile.dev"
  copy_file "jsconfig.json"
  copy_file "tailwind.config.js"
  copy_file "postcss.config.js"
  copy_file "vite.config.ts"

  directory "app", force: true
  directory "config", force: true
  directory "lib", force: true
end

def add_pages_controller
  generate "controller Pages home"
  route "root to: 'pages#home'"
end

# Main setup

after_bundle do
  set_application_name
  add_pages_controller
  add_javascript

  copy_templates
  add_vite

  rails_command "active_storage:install"

  remove_file "app/views/pages/home.html.erb"

  copy_file "app/views/pages/home.html.erb"

  # Commit everything to git
  unless ENV["SKIP_GIT"]
    git :init
    git add: "."
    # git commit will fail if user.email is not configured
    begin
      git commit: %( -m 'Initial commit' )
    rescue StandardError => e
      puts e.message
    end
  end

  say
  say "Jumpstart app successfully created!", :blue
  say
  say "To get started with your new app:", :green
  say "  cd #{app_name}"
  say
  say "  # Update config/database.yml with your database credentials"
  say
  say "  rails db:create && rails db:migrate"
  say "  rails g madmin:install # Generate admin dashboards"
  say "  gem install foreman"
  say "  foreman start # Run Rails, sidekiq, and vite"
end