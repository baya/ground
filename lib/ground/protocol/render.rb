module Ground::Protocol
  module Render

    include ::Rack::Utils

    def haml(path, status = 200)
      template = Tilt::HamlTemplate.new(File.join(views, "#{path}.haml"))
      content = template.render self
      text content, status
    end

    def json(content, status = 200)
      response['Content-Type'] = 'application/json; charset=UTF-8'
      response.status = status
      response.write(content)
      response.finish
    end

    def text(content, status = 200)
      response['Content-Type'] = 'text/html; charset=UTF-8'
      response.status = status
      response.write(content)
      response.finish
    end

    def forbid(content = nil)
      status = 403
      content ||= HTTP_STATUS_CODES[status]
      text content, status
    end

    def not_accept(content = nil)
      status = 406
      content ||= HTTP_STATUS_CODES[status]
      text content, status
    end

    def unauthorized(content = nil)
      status = 401
      content ||= HTTP_STATUS_CODES[status]
      text content, status
    end

  end
end
