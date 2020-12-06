class CreateBeerorders < ActiveRecord::Migration[5.2]
  def change
    create_table(:beerorders) do |t| #change to :boor_orders
      t.integer :beer_id 
      t.integer :order_id 
    end 
  end
end

# class RenameOldTableToNewTable < ActiveRecord::Migration
#   def change
#     rename_table :old_table_name, :new_table_name
#   end 
# end