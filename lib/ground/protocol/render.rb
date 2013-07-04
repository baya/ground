module Ground::Protocol
  module Render

    include ::Rack::Utils

    def json(content, status = 200)
      response_with(content, status, 'application/json; charset=UTF-8')
    end

    def xml(content, status = 200)
      response_with(content, status, 'application/xml; charset=UTF-8')
    end

    def html(content, status = 200)
      response_with(content, status, 'text/html; charset=UTF-8')
    end

    def text(content, status = 200)
      html content, status
    end

    def forbid(content = nil)
      response_as 403
    end

    def not_accept(content = nil)
      response_as 406
    end

    def unauthorized(content = nil)
      response_as 401
    end

    private

    def response_as(status, content=nil)
      content ||= HTTP_STATUS_CODES[status]
      text content, status
    end
    
    def response_with(content, status, content_type)
      response['Content-Type'] = content_type
      response.status = status
      response.write(content)
      response.finish
    end

  end
end
