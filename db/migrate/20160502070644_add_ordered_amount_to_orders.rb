class AddOrderedAmountToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :ordered_amount, :integer
  end
end
