module Ground
  class ConnectDatabase < Activity
    data_reader :adapter, :database, :pool, :timeout

    def initialize(data)
      @data = HashWithDoubleAccess data
    end

    def call
      case
    end

    private

    def sqlite
      Sequel.sqlite()
    end

    def pg
    end
    
  end
end
