require 'base64'

module StarRating
  module SassFunctions
    def self.included(base)
      base.module_eval do
        def encode64(string)
          assert_type string, :String
          ::Sass::Script::String.new(Base64.encode64(string.value))
        end
        declare :encode64, args: [:string]

        def number_of_stars
          ::Sass::Script::Number.new(StarRating::Engine.config.number_of_stars)
        end
      end
    end
  end
end
