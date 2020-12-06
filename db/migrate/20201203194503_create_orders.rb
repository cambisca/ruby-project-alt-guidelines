class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table(:orders) do |t|
      t.integer :user_id 
      t.integer :age
      # t.boolean :checked_out 
      t.datetime :date 
      # t.timestamps 
    end 
  end
end
