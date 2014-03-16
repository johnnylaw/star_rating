require 'spec_helper'

describe StarRating do
  describe '::DEFAULT_STAR_VALUES' do
    subject { StarRating::DEFAULT_STAR_VALUES }

    it { should eq [1, 2, 3, 4, 5] }
  end
end