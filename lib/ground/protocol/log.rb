module Ground::Protocol
  module Log

    def logger
      Ground.logger
    end

    def log(began_at, req, state, response)
      now = Time.now
      logger.info "(#{now - began_at}s) #{req.request_method} #{req.path_info} #{state} #{response[0]} #{response[1]}\n"
    end

  end
end
