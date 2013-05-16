# -*- coding: utf-8 -*-
require 'test_helper'
require 'rack/request'
require 'rack/response'
require 'rack'

BooksIndex = Ground::Ridge(path: '/books', verb: 'get')
BookShow = Ground::Ridge(path: '/book/:id', verb: 'get')
BookCreate = Ground::Ridge(path: '/book', verb: 'post')

class RidgeTest < Test::Unit::TestCase

  def test_routes
    assert Ground::Ridge.routes['GET:@:/books']    == BooksIndex
    assert Ground::Ridge.routes['GET:@:/book/:id'] == BookShow
    assert Ground::Ridge.routes['POST:@:/book']    == BookCreate
  end
  
end
