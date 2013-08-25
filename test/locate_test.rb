require 'test_helper'
require 'routes'

class LocateTest < Test::Unit::TestCase

  def test_locate
    location = Ground::Locate(verb: 'get', path: '/')
    assert_equal location, ['/', SiteIndex]
    
    location = Ground::Locate(verb: 'get', path: '/books')
    assert_equal location, ['/books', BooksIndex]

    location = Ground::Locate(verb: 'get', path: '/book/2')
    assert_equal location, ['/book/:id', BookShow]

    location = Ground::Locate(verb: 'post', path: '/book/3/comments')
    assert_equal location, ['/book/:id/comments', BookComments]

    location = Ground::Locate(verb: 'get', path: '/jim/notes')
    assert_equal location, ['/:username/notes', UserNotes]
  end

end
