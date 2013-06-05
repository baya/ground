# -*- coding: utf-8 -*-
require 'test_helper'

class HashWithDoubleAccessTest < Test::Unit::TestCase

  def test_double_access
    h = {:a => 1, 'b' => 2, 'c' => {'d' => 4, :e => 5}, 'g' => [1,2,3], 'h' => [{'a' => 1, 'cc' => [{'b' => 2}, {'c' => 3}]}, {'b' => 5}]}

    hd = HashWithDoubleAccess h

    assert_equal hd[:a], 1
    assert_equal hd['a'], 1
    assert_equal hd['c']['d'], 4
    assert_equal hd[:c][:d], 4
    assert_equal hd['c']['e'], 5
    assert_equal hd[:c][:e], 5

    assert_equal hd[:c]['d'], nil
    assert_equal hd[:c]['e'], nil
    assert_equal hd['c'][:e], nil
    assert_equal hd['c'][:d], nil

    assert_equal hd[:h].size, 2
    assert_equal hd[:h][0][:a], 1
    assert_equal hd[:h][1][:b], 5
    assert_equal hd['h'][0][:a], nil
    assert_equal hd['h'][1][:b], nil

  end

end
