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
        accept_type = suffix_to_accept_type $1
        if accept_type
          env['HTTP_ACCEPT'] = "#{accept_type}, #{env['HTTP_ACCEPT']}"
          env['PATH_INFO'] = env['PATH_INFO'].sub(suffix, '')
        end
      end

      @app.call(env)

    end

    private
    
    def suffix_to_accept_type(suffix)
      accept = Ground::MimeType.detect {|_, v| v == suffix.to_sym}
      accept[0] if accept
    end
    
  end
  
end
