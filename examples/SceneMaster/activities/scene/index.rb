# -*- coding: utf-8 -*-
module Scene
  Index = Ground::Ridge(path: '/scenes', verb: 'get')

  class Index
    
    data_reader :env

    def call
      response.write(template.render)
      response.finish
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
