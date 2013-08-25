module Ground
  class Log < Activity
    set :format, %{(%0.4fs) %s %s %s %s %s %s\n}
    
    data_reader :time
    data_reader :request_method, :path_info
    data_reader :state
    data_reader :response
    data_reader :params

    def call
      logger.info format % [time,
                            request_method,
                            path_info,
                            state,
                            response[0],
                            response[1],
                            "Parameters: #{params.select{|k, _| k.is_a? Symbol}}"]
    end

    private

    def logger
      Ground.logger || ::Logger.new(STDOUT)
    end
    
  end
end
