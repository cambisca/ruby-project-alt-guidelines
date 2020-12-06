class RemoveAgeAndDateColumnsInOrders < ActiveRecord::Migration[5.2]
  def change
    remove_column :orders, :age, :integer
    remove_column :orders, :date, :datetime
  end
end
