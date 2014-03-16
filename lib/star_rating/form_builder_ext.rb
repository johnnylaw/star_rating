module StarRating
  module FormBuilderExt
    def star_rating_field(method, size: nil, html: {})
      @template.star_rating_field(@object_name, method, size: size, html: html, value: @object && @object.send(method))
    end
  end
end