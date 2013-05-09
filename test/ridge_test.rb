require 'test_helper'

module Ground
  
  class Ridge < Activity

    data_reader :path, :verb
    data_default :verb, 'GET'


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

BooksIndex = Ground::Ridge(path: '/books') do
  def call
    @books = ['book1', 'book2', 'book3']
  end
end

BookShow = Ground::Ridge(path: '/book/:id') do
  set :view, 'books/show'
end

BookCreate = Ground::Ridge(path: '/book', verb: 'post') do
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
