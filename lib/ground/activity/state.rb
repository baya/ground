module Ground
  
  class State < Activity

    include Ground::Protocol::Render
    include Ground::Protocol::Render::Template
    
    data_reader :request, :params

    class << self
      
      def path(*args)
        paths = []
        route = detect_route('GET') || detect_route('POST')
        
        route[0].split('/').each_with_index {|route_seg, index|
          paths[index] = (route_seg =~ /^:\w+/ ? args.shift : route_seg)
        }
        paths << '/' if paths.size == 0
        paths.join('/')
        
      end

      def detect_route(verb)
        Ridge.routes[verb.to_s.upcase].detect {|route| route[1] == self}
      end
      
    end


    private

    def response
      @response ||= ::Rack::Response.new
    end

    def session
      @session ||= request.session
    end

  end
  
end
