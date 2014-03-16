module StarRating
  module FormHelperExt
    def star_rating_field(object_name, method, size: nil, html: {}, value: nil)
      css_class = ['star-rating', html.delete(:class)].compact.join(' ')
      html.merge!(class: css_class)
      if size
        width = size * StarRating::Engine.config.number_of_stars
        html.merge!(style: "width: #{width}px; height: #{size}px")
      end
      content_tag(
        :span,
        (1..StarRating::Engine.config.number_of_stars).map do |index|
          input_value = index * StarRating::Engine.config.scale
          checked = value == input_value
          radio_button(object_name, method, input_value, class: "star-rating-#{index}", checked: checked) + content_tag(:i)
        end.join.html_safe,
        html
      ).html_safe
    end
  end
end
