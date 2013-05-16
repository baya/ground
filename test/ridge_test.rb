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
    puts Ground::Ridge.routes['GET'].inspect
    puts Ground::Ridge.routes['POST'].inspect
  end
  
end
