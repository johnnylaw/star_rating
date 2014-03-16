require 'spec_helper'

describe StarRating::FormHelperExt do
  describe '#star_rating_field' do
    subject { ActionView::Base.new.star_rating_field(*args) }
    let(:expected_star_values) { StarRating::DEFAULT_STAR_VALUES }

    def assert_stuff
      # One span with an 'input' and an adjacent 'i' tag for each star value
      elements = Nokogiri::HTML::Document.parse(subject).css('body').children
      expect(elements.count).to eq 1

      span = elements.first
      expect(span.name).to eq 'span'
      expect(span.attributes.count).to eq expected_span_attributes.count
      expected_span_attributes.each do |key, value|
        expect(span.attributes[key.to_s].value).to eq value
      end

      inputs_and_i_tags = span.children
      expect(inputs_and_i_tags.count).to eq 10
      inputs_and_i_tags.each_slice(2).each_with_index do |els, ind|
        exp_val = expected_star_values[ind]
        input = els.first
        input.name.should eq 'input'
        input.attributes['value'].value.should eq exp_val.to_s
        input.attributes['class'].value.should eq "star-rating-#{exp_val}"
        input.attributes['name'].value.should eq 'opinion[rating]'
        input.attributes['type'].value.should eq 'radio'
        els.last.name.should eq 'i'
      end
    end

    context 'when no options are present' do
      let(:args) { [:opinion, :rating] }
      let(:expected_span_attributes) { { class: 'star-rating' } }

      it { assert_stuff }

      context 'when star values have been otherwise configured' do
        let(:expected_star_values) { [1, 2, 3, 5, 8] }

        before do
          StarRating.configure do |config|
            config.star_values = [1, 2, 3, 5, 8]
          end
        end

        after do
          StarRating.configure do |config|
            config.star_values = StarRating::DEFAULT_STAR_VALUES
          end
        end

        it { assert_stuff }
      end
    end

    context 'when the size option is present' do
      let(:args) { [:opinion, :rating, { size: 50 }] }
      let(:expected_span_attributes) { { class: 'star-rating', style: 'width: 250px; height: 50px' } }

      it { assert_stuff }
    end

    context 'when class option is present' do
      let(:expected_span_attributes) { { class: 'star-rating sheeeeeeit blam' } }
      context 'when class options is a string' do
        let(:args) { [:opinion, :rating, { html: {class: 'sheeeeeeit blam'} }] }

        it { assert_stuff }
      end

      context 'when class options is an array' do
        let(:args) { [:opinion, :rating, { html: {class: ['sheeeeeeit', 'blam']} }] }

        it { assert_stuff }
      end
    end

    context 'when other options are present' do
      let(:args) { [:opinion, :rating, { html: {'ng-class' => 'something.value'} }] }
      let(:expected_span_attributes) do
        { 'class' => 'star-rating', 'ng-class' => 'something.value' }
      end

      it { assert_stuff }
    end
  end
end