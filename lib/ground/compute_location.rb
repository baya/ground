module Ground

  class ComputeLocation < Activity
    data_reader :verb, :path

    def call
      "%s:@:%s" % [verb, path]
    end
    
  end
  
end
