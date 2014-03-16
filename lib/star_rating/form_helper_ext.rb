module StarRating
  module FormHelperExt
    def star_rating_field(object_name, method, size: nil, html: {})
      values ||= (1..StarRating::Engine.config.number_of_stars).map{ |i| i * StarRating::Engine.config.scale }
      css_class = ['star-rating', html.delete(:class)].compact.join(' ')
      html.merge!(class: css_class)
      if size
        width = size * values.count
        html.merge!(style: "width: #{width}px; height: #{size}px")
      end
      content_tag(
        :span,
        values.map do |value|
          radio_button(object_name, method, value, class: "star-rating-#{value}") + content_tag(:i)
        end.join.html_safe,
        html
      ).html_safe
    end
  end
end
