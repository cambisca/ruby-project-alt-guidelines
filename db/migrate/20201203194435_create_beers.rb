class CreateBeers < ActiveRecord::Migration[5.2]
  def change
    create_table(:beers) do |t|
      t.string :name 
      t.string :style 
      t.integer :price
      t.string :brewer 
  
    end 
  end
end
