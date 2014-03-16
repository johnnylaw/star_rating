require "star_rating/engine"
require 'sass'

module StarRating
  extend ActiveSupport::Autoload

  autoload :FormHelperExt
  autoload :FormBuilderExt
  autoload :SassFunctions
end

ActionView::Helpers::FormHelper.send :include, StarRating::FormHelperExt
ActionView::Base.default_form_builder.send :include, StarRating::FormBuilderExt
Sass::Script::Functions.send :include, StarRating::SassFunctions