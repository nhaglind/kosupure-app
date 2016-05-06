class AddTradeToListings < ActiveRecord::Migration
  def change
    add_column :listings, :trade, :boolean
  end
end
