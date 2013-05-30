module Scene
  Create = Ground::Ridge(path: '/scene', verb: 'post')

  class Create

    def call
      scene = params['scene']
      CreateScene << {name: scene['name'], description: scene['description']}
    end
    
  end
  
end
