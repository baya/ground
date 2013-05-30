Sequel.migration do
  up do
    create_table(:scenes) do
      primary_key :id
      String :name, :null=>false
      String :description, :text => true
    end
  end

  down do
    drop_table(:scenes)
  end
end
