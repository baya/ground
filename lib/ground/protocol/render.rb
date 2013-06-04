module Ground::Protocol
  module Render

    def haml(path)
      template = Tilt::HamlTemplate.new(File.join(views, "#{path}.haml"))
      output = template.render(self)
      response.write(output)
      response.finish
    end

  end
end
