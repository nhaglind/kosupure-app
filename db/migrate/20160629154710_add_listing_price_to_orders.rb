class AddListingPriceToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :listing_price, :decimal
  end
end
