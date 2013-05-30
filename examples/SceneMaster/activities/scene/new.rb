module Scene
  New = Ground::Ridge(path: '/scene/new', verb: 'get')

  class New

    def call
      response['Content-Type'] = 'text/html; charset=UTF-8'
      response.write(template.render)
      response.finish
    end


    private

    def template
      get_or_set :template do
        Tilt::HamlTemplate.new(File.join(view_dir, 'scene/new.haml'))
      end
    end

    def view_dir
      get_or_set :view_dir do
        File.expand_path File.join(File.dirname(__FILE__), '../..', 'views')
      end
    end

  end
  
end
