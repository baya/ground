require 'test_helper'

Index = Class.new
BooksIndex = Class.new
BookShow = Class.new
BookComments = Class.new
UserNotes = Class.new

Ground::Ridge(verb: 'get', path: '/', state: Index)
Ground::Ridge(verb: 'get', path: '/book/:id', state: BookShow)
Ground::Ridge(verb: 'get', path: '/books', state: BooksIndex)
Ground::Ridge(verb: 'post', path: '/book/:id/comments', state: BookComments)
Ground::Ridge(verb: 'get', path: '/:username/notes', state: UserNotes)


class LocateTest < Test::Unit::TestCase

  def test_verb_path
    location = Ground::Locate(verb: 'get', path: '/')
    assert_equal location, ['/', Index]
    
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
