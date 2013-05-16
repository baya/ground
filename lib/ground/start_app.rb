module Ground

  class StartApp < Activity

    data_reader :app, :port

    attr_reader :middlewares

    def initialize(data)
      super
      @middlewares = []
    end

    def call(&p)
      instance_eval &p
      app = pack_middlewares_to_app
      Rack::Server.start(app: app, Port: port)
    end

    private

    def use(middleware)
      @middlewares << middleware
    end

    def pack_middlewares_to_app
      app_with_middlewares = app.new
      middlewares.reverse.each {|middleware|
        app_with_middlewares = middleware.new(app_with_middlewares)
      }
      app_with_middlewares
    end
    
  end

end
