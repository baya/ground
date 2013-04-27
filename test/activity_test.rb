require 'test/unit'
require File.expand_path(File.join(File.dirname(__FILE__), '..', 'lib/ground'))

class A < Ground::Activity

  def call
    true
  end
  
end

module B
  class A < Ground::Activity
    def call
      true
    end
  end
end

class C
  class A < Ground::Activity
    def call
      true
    end
  end
end

class ActivityTest < Test::Unit::TestCase


  def test_capital_method
    assert A()
    assert B::A()
    assert C::A()
  end
  
end
