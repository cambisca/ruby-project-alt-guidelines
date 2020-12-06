class BeerOrders < ActiveRecord::Migration[5.2]
  def change
    rename_table :beerorders, :beer_orders
  end
end
