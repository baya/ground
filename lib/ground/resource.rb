module Ground
  
  class Resource < Activity
    
    data_reader :env, :route

    private

    def params
      get_or_set :params do
        p = request.GET
        path_segs = request.path_info.split('/')
        route.split('/').each_with_index {|route_seg, index|
          p[route_seg.sub(':', '')] = path_segs[index] if route_seg =~ /^:\w+/
        }
        params = {}
        p.each {|k, v| params[k.to_sym] = v}
        params.merge(p)
      end
    end

    def request
      @request ||= ::Rack::Request.new(env)
    end

    def response
      @response ||= ::Rack::Response.new
    end

  end
  
end
