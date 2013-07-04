module Ground
  
  class State < Activity

    include Ground::Protocol::Render
    include Ground::Protocol::Render::Template
    
    data_reader :env, :route, :config

    class << self
      
      def path(*args)
        paths = []
        route = Ridge.routes['GET'].detect {|route| route[1] == self }
        route ||= Ridge.routes['POST'].detect {|route| route[1] == self }
        
        route[0].split('/').each_with_index {|route_seg, index|
          paths[index] = (route_seg =~ /^:\w+/ ? args.shift : route_seg)
        }
        paths.join('/')
        
      end
      
    end

    private

    def params
      get_or_set :params do
        p = {}
        path_segs = request.path_info.split('/')
        route.split('/').each_with_index {|route_seg, index|
          p[route_seg.sub(':', '')] = path_segs[index] if route_seg =~ /^:\w+/
        }
        HashWithDoubleAccess p.merge(request.params)
      end
    end

    def request
      @request ||= ::Rack::Request.new(env)
    end

    def response
      @response ||= ::Rack::Response.new
    end

    def session
      @session ||= request.session
    end

    def redirect(target, status = 302)
      response.status = status
      response['Location'] = target
      response
    end

    def views
      config.views
    end

  end
  
end
