module Ground::Protocol
  module Log

    FORMAT = %{(%0.4fs) %s %s %s %s %s %s\n}

    def logger
      Ground.logger
    end

    def log(began_at, req, state, response, params)
      now = Time.now
      logger.info FORMAT % [now - began_at,
                            req.request_method,
                            req.path_info,
                            state,
                            response[0],
                            response[1],
                            "Parameters: #{params.select{|k, _| k.is_a? Symbol}}"]
    end

  end
end
