require 'spec_helper'

describe StarRating::Helpers do
  let(:template) { ActionView::Base.new }
  let(:args) { [] }
  subject { template.star_rating(*args) }
  let(:elements) { Nokogiri::HTML::Document.parse(subject).css('body').children }
  let(:expected_outer_span_attrs) { { class: 'star-rating' } }
  let(:expected_inner_span_attrs) { { style: "width: #{expected_width}" } }
  let(:expected_width) { '0%' }

  def assert_stuff
    expect(elements.count).to eq 1
    outer_span = elements.first
    expect(outer_span.name).to eq 'span'
    expect(outer_span.attributes.count).to eq expected_outer_span_attrs.count
    expected_outer_span_attrs.each do |key, value|
      expect(outer_span.attributes[key.to_s].value).to eq value
    end
    expect(outer_span.children.count).to eq 1
    inner_span = outer_span.children.first
    expect(inner_span.name).to eq 'span'
    expect(inner_span.attributes.count).to eq expected_inner_span_attrs.count
    expected_inner_span_attrs.each do |key, value|
      expect(inner_span.attributes[key.to_s].value).to eq value
    end
    expect(inner_span.inner_html).to be_empty
  end

  context 'when no args are present' do
    let(:expected_width) { '0%' }

    it 'outputs span.star-rating with an inner span of zero width' do
      assert_stuff
    end
  end

  context 'when value arg is present' do
    let(:args) { [2.7] }
    before do
      StarRating::Engine.config.stub(:number_of_stars).and_return(3)
    end

    context 'when scale is 1' do
      before { StarRating::Engine.config.stub(:scale).and_return(1) }
      let(:expected_width) { '90.0%' }

      it { assert_stuff }
    end

    context 'when scale is other than 1' do
      before { StarRating::Engine.config.stub(:scale).and_return(4) }
      let(:expected_width) { '22.5%' }

      it { assert_stuff }
    end
  end

  context 'when container_html options are present' do
    context 'when :class key is present' do
      let(:expected_outer_span_attrs) { { class: 'star-rating something something something dark-side' } }

      context 'when :class value is a string' do
        let(:args) do
          [
            {
              container_html: { class: 'something something something dark-side' }
            }
          ]
        end

        it { assert_stuff }
      end

      context 'when :class value is an array' do
        let(:args) do
          [
            {
              container_html: { class: ['something', 'something', 'something', 'dark-side'] }
            }
          ]
        end

        it { assert_stuff }
      end
    end

    context 'when other attributes are present' do
      let(:args) do
        [
          { container_html: { 'ng-class' => 'your-mom' } }
        ]
      end
      let(:expected_outer_span_attrs) { { class: 'star-rating', 'ng-class' => 'your-mom' } }

      it { assert_stuff }
    end
  end

  context 'when size option is present' do
    let(:args) { [{ size: 70}] }
    before do
      StarRating::Engine.config.stub(:number_of_stars).and_return(3)
    end
    let(:expected_outer_span_attrs) { { class: 'star-rating', style: "width: 210px; height: 70px" } }

    it { assert_stuff }
  end
end