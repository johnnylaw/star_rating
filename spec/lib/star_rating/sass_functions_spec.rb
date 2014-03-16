require 'spec_helper'

describe StarRating::SassFunctions do
  describe '.encode64' do
    it 'Base64 encodes its argument into a SASS string' do
      input = "$thing: encode64('some stuff goes in here'); body { margin: $thing }"
      output = Sass::Engine.new(input, :syntax => :scss, :style => :compact).render
      expect(output).to match 'body { margin: c29tZSBzdHVmZiBnb2VzIGluIGhlcmU= ; }'
    end
  end

  describe '.star_values' do
    it 'spits out the StarRating::Engine.config.star_values in a SASS array' do
      StarRating::Engine.config.stub(:star_values).and_return([1, 2, 3])
      input = '$values: star_values();
        @each $value in $values {
          .star-#{$value} {
            margin: $value * 1px;
          }
        }'
      output = Sass::Engine.new(input, :syntax => :scss, :style => :compact).render
      expect(output).to match '.star-1 { margin: 1px; }'
      expect(output).to match '.star-2 { margin: 2px; }'
      expect(output).to match '.star-3 { margin: 3px; }'
    end
  end
end