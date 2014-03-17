module StarRating
  module Helpers
    def star_rating(value = 0, size: nil, rating_html: {}, container_html: {})
      outer_css_class = ['star-rating', container_html.delete(:class)].compact.join(' ')
      html_attrs = { class: outer_css_class }
      if size
        width = size * StarRating::Engine.config.number_of_stars
        html_attrs.merge!(style: "width: #{width}px; height: #{size}px")
      end
      width_percentage = value * 100/StarRating::Engine.config.number_of_stars/StarRating::Engine.config.scale
      content_tag(
        :span,
        content_tag(
          :span,
          '',
          rating_html.merge(style: "width: #{width_percentage}%")
        ),
        html_attrs.merge(container_html)
      )
    end
  end
end