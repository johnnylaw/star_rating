require 'spec_helper'
require 'genspec'

describe 'star_rating:install' do
  it 'creates a star_rating_settings.css.scss file and puts commented-out defaults in it' do
    subject.should generate("app/assets/stylesheets/star_rating_settings.css.scss") { |content|
      lines = content.split("\n")
      lines.first.should =~ /^@import 'star_rating\/defaults';$/
      lines.last.should =~ /^@import 'star_rating';$/
      lines[1..-2].each do |line|
        line.should =~ /^(|\/\/.*)$/
      end
      content.should =~ /^\/\/ \$default-star-rating-height: 30px;$/
      content.should =~ /^\/\/ \$star-rating-spacing: 0;$/
      content.should =~ /^\/\/ \$star-rating-color-empty: rgba\(128, 128, 128, .3\);$/
      content.should =~ /^\/\/ \$star-rating-outline-color-empty: #888888;$/
      content.should =~ /^\/\/ \$star-rating-outline-width: 1;$/
      content.should =~ /^\/\/ \$star-rating-fill-start-x: 0%;$/
      content.should =~ /^\/\/ \$star-rating-fill-finish-x: 0%;$/
      content.should =~ /^\/\/ \$star-rating-fill-start-y: 10%;$/
      content.should =~ /^\/\/ \$star-rating-fill-finish-y: 90%;$/
      content.should =~ /^\/\/ \$star-rating-fill-color-start: #ffdf88;$/
      content.should =~ /^\/\/ \$star-rating-fill-color-finish: #ff9870;$/
      content.should =~ /^\/\/ \$star-rating-outline-color-full: none;$/
    }
  end
end
