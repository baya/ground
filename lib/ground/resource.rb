module Ground
  
  class Resource < Activity
    
    data_reader :env, :route

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

    def redirect(target, status = 302)
      response.status = status
      response['Location'] = target
      response
    end

  end
  
end
