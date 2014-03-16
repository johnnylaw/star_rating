module StarRating
  module FormBuilderExt
    def star_rating_field(method, values: nil, size: nil, html: {})
      @template.star_rating_field(@object_name, method, values: values, size: size, html: html)
    end
  end
end