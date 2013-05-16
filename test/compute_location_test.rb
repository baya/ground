require 'test_helper'

Ground::Ridge(verb: 'get', path: '/books')
Ground::Ridge(verb: 'get', path: '/book/:id')
Ground::Ridge(verb: 'get', path: '/book/:id/comments')
Ground::Ridge(verb: 'get', path: '/:username/notes')

class ComputeLocationTest < Test::Unit::TestCase

  def test_verb_path
    assert_equal Ground::ComputeLocation(verb: 'get', path: '/books'), 'GET:@:/books'
    assert_equal Ground::ComputeLocation(verb: 'get', path: '/book/1'), 'GET:@:/book/:id'
  end

end
