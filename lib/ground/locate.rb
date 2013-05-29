module Ground
  
  class Locate < Activity
    data_reader :verb, :path

    def initialize(data)
      super
      @verb = verb.upcase
    end

    def call
      path_segs = path.split('/')
      path_segs[0] = '/'
      match = false
      
      length_match_routes = Ridge.routes[verb].select {|route|
        route[0].split('/').size == path_segs.size
      }

      length_match_routes.detect {|route|
        segs = route[0].split('/')
        segs[0] = '/'
        segs.each_with_index {|seg, index|
          match = (path_segs[index] == seg)  if not seg =~ /^:\w+/
        }
        match
      }

    end

  end #Locate
  
end #Ground