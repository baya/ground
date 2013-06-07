require 'test_helper'

class ValidateTest < Test::Unit::TestCase

  def test_validate
    errors = Ground::Validate()
    assert_equal errors, {}
  end

end
