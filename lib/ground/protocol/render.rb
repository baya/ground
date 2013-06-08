module Ground::Protocol
  module Render

    def haml(path)
      response['Content-Type'] = 'text/html; charset=UTF-8'
      template = Tilt::HamlTemplate.new(File.join(views, "#{path}.haml"))
      output = template.render(self)
      response.write(output)
      response.finish
    end

    def json(content)
      response['Content-Type'] = 'text/json; charset=UTF-8'
      output = response.write(content.to_json)
      response.write(output)
      response.finish
    end

  end
end
