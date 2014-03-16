module StarRating
  DEFAULT_NUMBER_OF_STARS = 5
  DEFAULT_SCALE = 1

  class Engine < ::Rails::Engine
    isolate_namespace StarRating
    config.number_of_stars = DEFAULT_NUMBER_OF_STARS
    config.scale = DEFAULT_SCALE
  end

  def self.configure(&block)
    yield Engine.config if block
    Engine.config
  end
end
