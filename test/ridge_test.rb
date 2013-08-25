# -*- coding: utf-8 -*-
require 'test_helper'
require 'routes'

class RidgeTest < Test::Unit::TestCase

  def test_state_path
    assert_equal SiteIndex.path, '/'
    assert_equal BookShow.path(1), '/book/1'
    assert_equal BooksIndex.path, '/books'
    assert_equal BookComments.path(1), '/book/1/comments'
    assert_equal UserNotes.path('jim'), '/jim/notes'
  end
  
end
