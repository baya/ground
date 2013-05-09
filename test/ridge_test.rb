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
end

BookCreate = Ground::Ridge(path: '/book', verb: 'post')

class BookCreate
  data_reader :name, :price, :isbn

  def call
  end
  
end

class BookCreate
  def call
  end
end

class RidgeTest < Test::Unit::TestCase

  def test_route
    puts BookCreate.ancestors
  end
  
end
