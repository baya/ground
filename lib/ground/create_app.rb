module Ground


  class CreateApp < Activity
    data_reader :name

    def call
      Class.new do
        def call(env)
          req = Rack::Request.new(env)
          location = Ground::ComputeLocation(verb: req.request_method,
                                             path: req.path_info)
          
          Ground::Ridge.routes[location] << {env: env}
        end
      end
    end
    
  end

end
