module Ground

  # When request's path contains a suffix like json, xml etc,
  # it will git rid of the suffix and set the accept header
  # by the suffix
  # 
  # Example:
  #   get '/book/:id.json'
  # 
  # the request path '/book/2.json' will become '/book/2', and
  # the request accept header will be added a 'application/json'
  # mime type
  class UrlSuffix

    def initialize(app)
      @app = app
    end

    def call(env)
      suffix = /\.(\w+)$/
      if env['PATH_INFO'].match(suffix)
        env['PATH_INFO'] = env['PATH_INFO'].sub(suffix, '')
      end

      @app.call(env)

    end
    
  end
  
end
