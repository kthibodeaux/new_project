module NewProject
  class Project
    attr_reader :snake_name, :camel_name

    def initialize(snake_name)
      @snake_name  = snake_name.downcase
      @camel_name  = snake_name.camelcase
    end

    def to_h()
      {
        snake_name: snake_name,
        camel_name: camel_name
      }
    end

  end
end
