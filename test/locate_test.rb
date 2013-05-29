require 'test_helper'

BooksIndex = Ground::Ridge(verb: 'get', path: '/books')
BookShow = Ground::Ridge(verb: 'get', path: '/book/:id')
BookComments = Ground::Ridge(verb: 'post', path: '/book/:id/comments')
UserNotes = Ground::Ridge(verb: 'get', path: '/:username/notes')

class LocateTest < Test::Unit::TestCase

  def test_verb_path
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
