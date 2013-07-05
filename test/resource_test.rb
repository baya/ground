require 'test_helper'

BookShow = Ground::Ridge(path: '/book/:id', verb: 'get')
BooksIndex = Ground::Ridge(path: '/books', verb: 'get')
BookTags = Ground::Ridge(path: '/book/:id/tags', verb: 'get')
BookCreate = Ground::Ridge(path: '/book', verb: 'post')
BookTag = Ground::Ridge(path: '/book/:book_id/tag/:tag_id', verb: 'get')

class ResourceTest < Test::Unit::TestCase

  def test_resource_path
    assert_equal BooksIndex.path, '/books'
    assert_equal BookShow.path(1), '/book/1'
    assert_equal BookTags.path(2), '/book/2/tags'
    assert_equal BookCreate.path, '/book'
    assert_equal BookTag.path(1,2), '/book/1/tag/2'
  end

end