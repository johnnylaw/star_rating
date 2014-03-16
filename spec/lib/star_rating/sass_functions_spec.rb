require 'spec_helper'

describe StarRating::SassFunctions do
  describe '.encode64' do
    it 'Base64 encodes its argument into a SASS string' do
      input = "$thing: encode64('some stuff goes in here'); body { margin: $thing }"
      output = Sass::Engine.new(input, :syntax => :scss, :style => :compact).render
      expect(output).to match 'body { margin: c29tZSBzdHVmZiBnb2VzIGluIGhlcmU= ; }'
    end
  end

  describe '.number_of_stars' do
    it 'spits out the StarRating::Engine.config.number_of_stars in a SASS number' do
      StarRating::Engine.config.stub(:number_of_stars).and_return(3)
      input = '@for $i from 1 through number_of_stars() {
          .star-rating-#{$i} {
            margin: $i * 1px;
          }
        }'
      output = Sass::Engine.new(input, :syntax => :scss, :style => :compact).render
      expect(output).to match '.star-rating-1 { margin: 1px; }'
      expect(output).to match '.star-rating-2 { margin: 2px; }'
      expect(output).to match '.star-rating-3 { margin: 3px; }'
    end
  end
end