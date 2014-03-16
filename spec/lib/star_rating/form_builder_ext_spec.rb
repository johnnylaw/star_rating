require 'spec_helper'

describe StarRating::FormBuilderExt do
  describe '#star_rating_field' do
    let(:template) { ActionView::Base.new }

    it 'calls the template star_rating_field with the same options and the object name' do
      template.stub(:protect_against_forgery?)
      template.should_receive(:star_rating_field).with(:opinion, :rating, values: 'values', size: 'size', html: { a: 'ay' }).and_return('something')

      output = '' # Must refer to 'output' outside block in order for it to be set inside
      template.form_for :opinion, url: 'some-url' do |f|
        output = f.star_rating_field :rating, values: 'values', size: 'size', html: { a: 'ay' }
      end

      expect(output).to eq 'something'
    end
  end
end