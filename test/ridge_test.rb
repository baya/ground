require 'test_helper'

module Ground
  
  class Ridge < Activity

    data_reader :path, :verb
    data_default :verb, 'GET'

    def call(&p)
      c = Class.new(Activity)
      c.class_eval &p if block_given?
      c
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

  def test_route
    assert BookCreate << {name: 'name'}
  end
  
end
