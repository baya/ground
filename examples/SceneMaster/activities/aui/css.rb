module Aui
  
  CSS = Ground::Ridge(path: '/aui/css/aui-all.css', verb: 'get')

  class CSS

    def call
      response.write(content)
      response.finish
    end

    def response
      get_or_set :response do
        res = ::Rack::Response.new
        res['Content-type'] = 'text/css'
        res['Accept-Charset'] = 'utf-8'
        res
      end
    end

    def content
      File.read(File.join(template_dir, 'aui-all.css'))
    end

    def template_dir
      File.expand_path File.join(File.dirname(__FILE__), '../..', 'aui', 'css')
    end

  end
  
end
