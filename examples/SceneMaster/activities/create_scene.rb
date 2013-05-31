class CreateScene < Ground::Activity
  
  data_reader :name, :description

  def call
    dataset.insert(name: name, description: description)
  end

  private

  def dataset
    DB[:scenes]
  end
  
end
