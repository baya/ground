module Ground
  class BaseRack

    include Ground::Protocol::Log

    def call(env)
      began_at = Time.now
      req = Rack::Request.new(env)
      route, state = Ground::Locate(verb: req.request_method, path: req.path_info)
      params = get_params(req, route)
      response = state << {request: req, params: params}
      log began_at, req, state, response, params
      
      response
    end

    private

    def get_params(request, route)
      p = {}
      path_segs = request.path_info.split('/')
      route.split('/').each_with_index {|route_seg, index|
        p[route_seg.sub(':', '')] = path_segs[index] if route_seg =~ /^:\w+/
      }
      HashWithDoubleAccess p.merge(request.params)
    end
    
  end
end
