module Ground::Protocol
  module Verb
    
    def get(path, state)
      ridge path: path, verb: 'get', state: state  
    end

    def post(path, state)
      ridge path: path, verb: 'post', state: state
    end

    def match(path, state)
      get path, state
      post path, state
    end

    def ridge(data)
      Ground::Ridge data
    end
    
  end  
end
