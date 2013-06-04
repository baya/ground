module Ground
  class Config < Activity
    data_reader :views, :root

    def call
      self
    end
    
  end
end
