# -*- coding: utf-8 -*-
require 'test_helper'
require 'rack/request'
require 'rack/response'
require 'rack'

SiteIndex = Class.new
BookShow = Class.new
BooksIndex = Class.new
BookTags = Class.new
BookCreate = Class.new

Ground::Ridge(path: '/', verb: 'get', state: SiteIndex)
Ground::Ridge(path: '/book/:id', verb: 'get', state: BookShow)
Ground::Ridge(path: '/books', verb: 'get', state: BooksIndex)
Ground::Ridge(path: '/book/:id/tags', verb: 'get', state: BookTags)
Ground::Ridge(path: '/book', verb: 'post', state: BookCreate)

class RidgeTest < Test::Unit::TestCase

  def test_routes
    assert_equal Ground::Ridge.routes['GET'], [["/", SiteIndex], ["/book/:id", BookShow], ["/books", BooksIndex], ["/book/:id/tags", BookTags]]
    assert_equal Ground::Ridge.routes['POST'], [["/book", BookCreate]]
  end

  def test_states
    assert_equal Ground::Ridge.states, [SiteIndex, BookShow, BooksIndex, BookTags, BookCreate]
  end
  
end
