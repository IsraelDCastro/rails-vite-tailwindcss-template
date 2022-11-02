class StimulusGenerator < Rails::Generators::NamedBase
  source_root File.expand_path("templates", __dir__)

  def create_controller
    template('controller.js', File.join("app/frontend/controllers/#{file_name}_controller.js"))
  end
end
