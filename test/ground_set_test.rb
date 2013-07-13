require 'test_helper'

Ground do
  set :env, (ENV['RACK_ENV'] || :development).to_sym
end

class GroundSetTest < Test::Unit::TestCase

  def test_set_attribute
    assert_equal Ground.env, :development
  end

end
