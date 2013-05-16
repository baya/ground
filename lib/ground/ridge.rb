# -*- coding: utf-8 -*-
module Ground
  
  class Ridge < Activity

    data_reader :path, :verb

    class << self

      attr_reader :routes

      # 路由节点的结构 [name, activity, [sub_node_1, sub_node_2, sub_node_3, ...]]
      def route(verb, path, activity)
        
        if @routes.nil?
          @routes = {'GET' => [['/', 0, []]], 'POST' => [['/', 0, []]]}
        end

        names = path.split('/')
        names[0] = '/'
        route_nodes = @routes[verb]
        
        names.each_with_index {|name, index|
          node = route_nodes.detect {|node| node[0] == name }
          
          if node
            node[1] = activity if index == names.size - 1
            route_nodes = node[2] 
          else
            a = index == names.size - 1 ? activity : 0
            node = [name, a, []]
            route_nodes << node
            route_nodes = node[2]
          end
        }
        
      end

    end

    def initialize(data)
      super
      @verb = verb.upcase
    end

    def call(&p)
      activity = Class.new(Activity)
      route(activity)
      activity.class_eval &p if block_given?
      activity
    end

    private

    def route(activity)
      self.class.route(verb, path, activity)
    end

  end

end
