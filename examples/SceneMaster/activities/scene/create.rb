module Scene
  Create = Ground::Ridge(path: '/scene', verb: 'post')

  class Create

    def call
      CreateScene params[:scene]
      redirect '/scenes'
    end
    
  end
  
end
