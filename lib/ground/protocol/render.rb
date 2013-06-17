module Ground::Protocol
  module Render

    def haml(path)
      response['Content-Type'] = 'text/html; charset=UTF-8'
      template = Tilt::HamlTemplate.new(File.join(views, "#{path}.haml"))
      response.write(template.render(self))
      response.finish
    end

    def json(content)
      response['Content-Type'] = 'application/json; charset=UTF-8'
      response.write(content)
      response.finish
    end

    def text(content)
      response['Content-Type'] = 'text/html; charset=UTF-8'
      response.write(content)
      response.finish
    end

  end
end
