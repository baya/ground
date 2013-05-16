module Ground

  class ComputeLocation < Activity
    data_reader :verb, :path

    def initialize(data)
      super
      @verb = verb.upcase
    end

    def call
      names = path.split('/')
      names[0] = '/'
      route_nodes = Ridge.routes[verb]
      node = []

      names.each {|name, index|
        node = route_nodes.detect {|node| node[0] == name }
        if node
          route_nodes = node[2]
        end
      }

      node = [] if node.nil?

      node
      
    end


  end
  
end
