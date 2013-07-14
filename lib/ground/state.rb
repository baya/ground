module Ground
  
  class State < Activity

    include Ground::Protocol::Render
    include Ground::Protocol::Render::Template
    
    data_reader :request, :params

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
    
    def response
      @response ||= ::Rack::Response.new
    end

    def session
      @session ||= request.session
    end

  end
  
end
