class AddShippingNameToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :shipping_name, :string
  end
end
