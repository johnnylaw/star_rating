# star_rating gem
[![Build Status](https://travis-ci.org/johnnylaw/star_rating.png?branch=master)](https://travis-ci.org/johnnylaw/star_rating)
[![Code Climate](https://codeclimate.com/github/johnnylaw/star_rating.png)](https://codeclimate.com/github/johnnylaw/star_rating)
[![Gem Version](https://badge.fury.io/rb/star_rating.png)](http://badge.fury.io/rb/star_rating)

The star_rating gem allows for the easy integration of a star rating widget into a Rails app running Ruby 2.0 or higher.  The star rating form input as well as the star rating display helper rely entirely on Sass (no JavaScript) to create a **highly** configurable arrangement of any number of stars of any size and appearance.  The default number of stars is of course five. Visit [the codepen demo](http://codepen.io/johnnylaw/pen/Iivyz/) to see a smattering of what it does.

### Installing star_rating

Install manually using

    gem install star_rating

or more canonically place the following in your Gemfile:

    gem 'star_rating'

and run

    bundle

from the Rails root.  Then run

    rails g star_rating:install

to install ````app/assets/stylesheets/star_rating_settings.css.scss````, the file in which you can override any default settings.

NOTE: The generator will NOT explicitly put a ````*= require star_rating_settings```` in your ````application.*ss```` manifest file, so you will need to do that unless you are using a ````*= require_tree .```` statement in your manifest.

## The form helper

The form helper comes in two varieties just like every other Rails form helper:

    star_rating_input(object_name, method, value: nil, size: nil, html: {})

and

    star_rating_input(method, size: nil, html: {})

the latter being used as part of a form builder, e.g.

    <%= form_for @opinion do |f| %>
      <%= f.star_rating_input :rating %>
      ...
      <%= f.submit 'Rate' %>
    <% end %>

- The ````value```` option is the value of the currently selected star if the form is for an already existing object. This option is neither necessary nor available on the form builder method.
- The ````size```` option represents the height of the row of stars (in pixels).  You can configure a default in  star_rating_settings.css.scss.
- The ````html```` option is for attributes of the &lt;span&gt; tag that contains the form inputs. If a class is given, it will be added to the .star-rating class necessary for proper rendering.

## The view helper

This is for rendering already existing ratings or possibly an average rating for an item.

    star_rating(value = 0, size: nil, rating_html: {}, container_html: {})

- ````value```` is the value of the rating to be rendered, e.g. 3.3 as shown above
- The ````size```` option is as with the form helper.
- The ````rating_html```` and the ````container_html```` options are for adding HTML attributes to either of the two containers that make up the output, which essentially looks like (in the example of a value of 3.3 on a 5-point scale):

    ````<span class="star-rating"><span style="width: 66.7%"></span></span>````

A possible use of the ````rating_html```` option would be as follows if you wanted to bind the rating to an AngularJS model:

    star_rating(3.3, rating_html: { 'ng-model' => 'rating' })

speaking of which, my limited knowledge of AngularJS, EmberJS and other JS frameworks prevented me from making the form helpers more configurable, so please hit me with suggestions and/or pull requests if you know how the gem could be better suited for these things.

## Configuration options
By default there are five stars with values [1, 2, 3, 4, 5], and both the form helper and the view display helper behave accordingly. You can, however, override these settings in a file in ````config/initializers```` with:

    StarRating.configure do |config|
      config.number_of_stars = 6
      config.scale = 2
    end

which would produce 6 stars with values [2, 4, 6, 8, 10, 12].  Additionally the appearance of the stars is highly configurable, utilizing SVG graphics, allowing for changes to spacing, color, outline, gradient (for the "full" stars), and you can even replace the url of the images altogether in the SCSS override file installed by the generator and get something entirely different, such as hearts or babies' faces or baboons' butts.

See the SASS file created by the generator for explicit details about how to configure the different appearance options.

This project is 5-star and uses MIT-LICENSE.

