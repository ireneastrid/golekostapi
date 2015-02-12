class ChangePriceFormatInStuff < ActiveRecord::Migration
  def change
  	change_column :stuffs, :price, :float
  end
end
