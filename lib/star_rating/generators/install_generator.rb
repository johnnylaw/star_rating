require 'rails/generators'

module StarRating
  module Generators
    class InstallGenerator < ::Rails::Generators::Base
      def add_stylesheet
        settings_file = File.join(File.dirname(__FILE__), "..", "..", "..", "vendor", "assets", "stylesheets", "star_rating", "_settings.scss")
        file_name = "app/assets/stylesheets/star_rating_settings.css.scss"
        create_file file_name, File.read(settings_file)
        prepend_to_file file_name, "@import 'star_rating/defaults';\n\n"
        gsub_file file_name, /^[\$]/, '// $'
        append_to_file file_name, "\n\n@import 'star_rating';"
      end
    end
  end
end
