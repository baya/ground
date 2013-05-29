# -*- coding: utf-8 -*-
require 'test_helper'
require 'rack/request'
require 'rack/response'
require 'rack'

SiteIndex = Ground::Ridge(path: '/', verb: 'get')
BookShow = Ground::Ridge(path: '/book/:id', verb: 'get')
BooksIndex = Ground::Ridge(path: '/books', verb: 'get')
BookTags = Ground::Ridge(path: '/book/:id/tags', verb: 'get')
BookCreate = Ground::Ridge(path: '/book', verb: 'post')

class RidgeTest < Test::Unit::TestCase

  def test_routes
    assert_equal Ground::Ridge.routes['GET'], [["/", SiteIndex], ["/book/:id", BookShow], ["/books", BooksIndex], ["/book/:id/tags", BookTags]]
    assert_equal Ground::Ridge.routes['POST'], [["/book", BookCreate]]
  end
  
end
