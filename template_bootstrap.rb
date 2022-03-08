require "fileutils"
require "shellwords"

def add_template_repository_to_source_path
  if __FILE__ =~ %r{\Ahttps?://}
    require "tmpdir"
    source_paths.unshift(tempdir = Dir.mktmpdir("rails-"))
    at_exit { FileUtils.remove_entry(tempdir) }
    git clone: [
      "--quiet",
      "https://github.com/IsraelDCastro/rails-vite-tailwindcss-template.git",
      tempdir
    ].map(&:shellescape).join(" ")

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
  gem "image_processing", "~> 1.2"
  gem "annotate", group: :development
end

def set_application_name
  # Add Application Name to Config
  environment "config.application_name = Rails.application.class.module_parent_name"

  # Announce the user where they can change the application name in the future.
  puts "You can change application name inside: ./config/application.rb"
end

def add_vite
  run 'bundle exec vite install'
end

def add_javascript
  run "yarn add bootstrap @popperjs/core sass vite vue"
  run "yarn add -D @vitejs/plugin-vue @vue/compiler-sfc eslint eslint-plugin-vue path vite-plugin-full-reload vite-plugin-ruby"
end

def copy_templates
  # remove_file "app/frontend/entrypoints/application.js"
  # remove_file "app/frontend/components" # Webpack

  copy_file "Procfile.dev"
  copy_file "jsconfig.json"
  copy_file "vite.config.ts"

  directory "bootstrap/app", force: true
  directory "bootstrap/config", force: true
end

def add_pages_controller
  generate "controller Pages home"
  route "root to: 'pages#home'"
end

# Main setup

add_gems

after_bundle do
  add_template_repository_to_source_path
  set_application_name
  add_pages_controller
  add_javascript

  copy_templates
  add_vite

  rails_command "active_storage:install"

  remove_file "bootstrap/app/views/pages/home.html.erb"

  copy_file "bootstrap/app/views/pages/home.html.erb"

  # rails_command "db:migrate"
  # Commit everything to git
  begin
    git add: (".")
    git commit: %( -m 'Initial commit' )
  rescue StandardError => e
    puts e.message
  end

  say
  say "Rails 7 + Vue 3 + ViteJS + Bootstap 5 created!", :green
  say
  say "To get started with your new app:", :yellow
  say "  cd #{app_name}"
  say
  say "  #Please update config/database.yml with your database credentials"
  say
  say "  rails s"
end