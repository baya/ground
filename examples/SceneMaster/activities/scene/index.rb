# -*- coding: utf-8 -*-
module Scene
  Index = Ground::Ridge(path: '/scene/:id/book/:tag/comments', verb: 'get')

  class Index

    def call
      response['Content-type'] = 'text/html'
      response['Accept-Charset'] = 'utf-8'
      response.write(template.render)
      response.finish
    end

    private


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
