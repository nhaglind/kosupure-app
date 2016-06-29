class AddListingNameToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :listing_name, :string
  end
end
