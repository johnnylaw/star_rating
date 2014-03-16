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

        def star_values
          literals = StarRating::Engine.config.star_values.map{ |value| ::Sass::Script::Number.new(value) }
          ::Sass::Script::List.new literals, :comma
        end
      end
    end
  end
end
