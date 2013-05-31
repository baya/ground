# -*- coding: utf-8 -*-
module Scene
  Index = Ground::Ridge(path: '/scenes', verb: 'get')

  class Index

    def call
      response['Content-Type'] = 'text/html; charset=UTF-8'
      @scenes = find_last_scenes(3)
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

    def find_last_scenes(num)
      DB[:scenes].order(:id).limit(num)
    end

  end
  
end
