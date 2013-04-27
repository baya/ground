require 'test_helper'

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

module B
  class H < Ground::Activity
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

class C
  class D < Ground::Activity
    def call
      true
    end
  end
end


class JustReturnActivitySelf < Ground::Activity
  data_reader :a, :b, :c, :d

  data_default :a, 'a'
  data_default :b, 'b'

  set :name, 'name'

  def call
    self
  end
  
end

class ActivityTest < Test::Unit::TestCase


  def test_capital_method
    assert A()
    assert B::A()
    assert C::D()
    assert C::A()
    assert C::D()

    assert A << {}
    assert B::A << {}
    assert B::H << {}
    assert C::A << {}
    assert C::D << {}
  end

  def test_data_reader
    activity = JustReturnActivitySelf(a: 'a', b: 'b', c: 'c', d: 'd')
    
    assert_equal activity.a, 'a'
    assert_equal activity.b, 'b'
    assert_equal activity.c, 'c'
    assert_equal activity.d, 'd'
  end

  def test_data_default
    activity = JustReturnActivitySelf(a: 'aa', c: 'c')

    assert_equal activity.a, 'aa'
    assert_equal activity.b, 'b'
    assert_equal activity.c, 'c'
    assert_equal activity.d, nil
  end

  def test_set
    activity = JustReturnActivitySelf(a: 'a')

    assert_equal activity.name, 'name'
  end
  
end
