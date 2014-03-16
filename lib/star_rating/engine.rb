module StarRating
  DEFAULT_STAR_VALUES = [1, 2, 3, 4, 5]

  class Engine < ::Rails::Engine
    isolate_namespace StarRating
    config.star_values = DEFAULT_STAR_VALUES
  end

  def self.configure(&block)
    yield Engine.config if block
    Engine.config
  end
end
