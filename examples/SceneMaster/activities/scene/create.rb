module Scene
  Create = Ground::Ridge(path: '/scene', verb: 'post')

  class Create

    def call
      puts params.inspect
      CreateScene params[:scene]
    end
    
  end
  
end
