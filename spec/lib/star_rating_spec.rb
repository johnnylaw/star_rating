require 'spec_helper'

describe StarRating do
  describe '::DEFAULT_NUMBER_OF_STARS' do
    subject { StarRating::DEFAULT_NUMBER_OF_STARS }

    it { should eq 5 }
  end

  describe '::DEFAULT_SCALE' do
    subject { StarRating::DEFAULT_SCALE }

    it { should eq 1 }
  end
end