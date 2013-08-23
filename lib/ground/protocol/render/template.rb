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

      def erb(file, &p)
        template = ERB.new(File.read(File.join(Ground.root, file)))
        template.result(binding)
      end

      def static(file, &p)
        File.read(File.join(Ground.root, file))
      end

    end
  end
end
