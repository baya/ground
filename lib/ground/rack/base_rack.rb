module Ground
  class BaseRack
    
    attr_reader :env
    attr_reader :request

    def call(env)
      start_time = Time.now
      set_request Rack::Request.new(env)

      route, state = Ground::Locate(verb: request_method, path: path_info)
      return non_exist_route if state.nil?

      params = get_params route
      response = state << {request: request, params: params}
      time = Time.now - start_time
      Ground::Log({
                    time:           time,
                    request_method: request_method,
                    path_info:      request.env['REQUEST_PATH'],
                    state:          state,
                    response:       response,
                    params:         params
                  })
      
      response
    end

    private

    def set_request request
      @request = request
    end

    def request_method
      request.request_method
    end

    def path_info
      request.path_info
    end

    def get_params(route)
      p = {}
      path_segs = request.path_info.split('/')
      route.split('/').each_with_index {|route_seg, index|
        p[route_seg.sub(':', '')] = path_segs[index] if route_seg =~ /^:\w+/
      }
      HashWithDoubleAccess p.merge(request.params)
    end

    def non_exist_route
      Rack::Response.new(["Non Exist Route: #{request_method} #{path_info}"], 500)
    end
    
  end
end
