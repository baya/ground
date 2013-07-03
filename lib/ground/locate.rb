module Ground
  
  class Locate < Activity
    data_reader :verb, :path

    def initialize(data)
      super
      @verb = verb.upcase
    end

    def call
      path_segs = split_to_segs(path)
      
      length_match_routes = Ridge.routes[verb].select {|route|
        route_segs = split_to_segs(route[0])
        route_segs.size == path_segs.size
      }

      length_match_routes.detect {|route|
        match = true
        route_segs = split_to_segs(route[0])
        route_segs.each_with_index {|route_seg, index|
          match = (path_segs[index] == route_seg)  if not route_seg =~ /^:\w+/
          break if not match
        }
        match
      }

    end

    private

    def split_to_segs(path)
      segs = path.split('/')
      segs[0] = '/'
      segs
    end

  end
  
end
