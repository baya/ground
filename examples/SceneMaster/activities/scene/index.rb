# -*- coding: utf-8 -*-
module Scene
  Index = Ground::Ridge(path: '/scene/:id/book/:tag/comments', verb: 'get')

  class Index
    
    data_reader :env, :route

    def call
      response.write(template.render)
      response.finish
    end

    private

    def params
      get_or_set :params do
        p = request.GET
        path_segs = request.path_info.split('/')
        route.split('/').each_with_index {|route_seg, index|
          p[route_seg.sub(':', '')] = path_segs[index] if route_seg =~ /^:\w+/
        }
        params = {}
        p.each {|k, v| params[k.to_sym] = v}
        params.merge(p)
      end
    end

    def request
      ::Rack::Request.new(env)
    end

    def response
      get_or_set :response do
        res = Rack::Response.new
        res['Content-type'] = 'text/html'
        res['Accept-Charset'] = 'utf-8'
        res
      end
    end

    def template
      get_or_set :template do
        Tilt::HamlTemplate.new(File.join(view_dir, 'scene/index.haml'))
      end
    end

    def view_dir
      get_or_set :view_dir do
        File.expand_path File.join(File.dirname(__FILE__), '../..', 'views')
      end
    end
    
  end
  
end
