module Ground::Protocol
  module Render
    module Template

      def haml(path, &p)
        template = Tilt::HamlTemplate.new(File.join(Ground.views, "#{path}.haml"))
        template.render self, &p
      end

      def slim(path, &p)
        template = Slim::Template.new(File.join(Ground.views, "#{path}.slim"))
        template.render self, &p
      end

    end
  end
end
