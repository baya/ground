# -*- coding: utf-8 -*-
require 'test_helper'
require 'rack/request'
require 'rack/response'
require 'rack'

module Ground
  
  class Ridge < Activity

    data_reader :path, :verb

    class << self

      attr_reader :routes

      def route(location, activity)
        @routes ||= {}
        @routes[location] = activity
      end

    end
    
    def call(&p)
      activity = Class.new(Activity)
      route(activity)
      activity.class_eval &p if block_given?
      activity
    end

    private

    def route(activity)
      self.class.route(location, activity)
    end

    def location
      "%s:@:%s" % [verb.upcase, path]
    end
    
  end

end


BooksIndex = Ground::Ridge(path: '/books', verb: 'get')

class BooksIndex
  
  data_reader :request
  
  def call
    @books = ['book1', 'book2', 'book3']
    res = Rack::Response.new
    res['Content-type'] = 'text/html'
    @books.each {|book|
      res.write "<h2>#{book}</h2>"
    }
    res.finish
    res
  end
end

BookShow = Ground::Ridge(path: '/book/:id', verb: 'get') do
  set :view, 'books/show'
end

BookCreate = Ground::Ridge(path: '/book', verb: 'post') do

  data_reader :name, :price, :isbn
  
  def call
    true
  end
  
end

class RidgeTest < Test::Unit::TestCase

  def test_routes
    assert Ground::Ridge.routes['GET:@:/books']    == BooksIndex
    assert Ground::Ridge.routes['GET:@:/book/:id'] == BookShow
    assert Ground::Ridge.routes['POST:@:/book']    == BookCreate
  end
  
end


class ComputeLocation < Ground::Activity
  data_reader :verb, :path

  def call
    "%s:@:%s" % [verb, path]
  end
  
end

class CreateApp < Ground::Activity
  data_reader :name

  def call
    Class.new do
      def call(env)
        req = Rack::Request.new(env)
        location = ComputeLocation verb: req.request_method, path: req.path_info
        res = Ground::Ridge.routes[location] << {request: req}
      end
    end
  end
  
end

BookStore = CreateApp(name: '网络书店')

class StartApp < Ground::Activity

  data_reader :app, :port

  def call
    Rack::Server.start(app: app.new, Port: port)
  end
  
end

StartApp app: BookStore, port: 9393





