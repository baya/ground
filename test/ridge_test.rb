require 'test_helper'

module Ground
  
  class Ridge < Activity


    def self.get(path)
    end

    def call
      Class.new(Activity)
    end
    
  end

  
end

Books = Ground::Ridge(path: '/books')
class Books
end

class RidgeTest < Test::Unit::TestCase

  def test_route
  end
  
end
