require "star_rating/engine"

module StarRating
  extend ActiveSupport::Autoload

  autoload :FormHelperExt
  autoload :FormBuilderExt
end

ActionView::Helpers::FormHelper.send(:include, StarRating::FormHelperExt)
ActionView::Base.default_form_builder.send(:include, StarRating::FormBuilderExt)
