class ChangePriceToInteger < ActiveRecord::Migration
  def change
  		change_column :stuffs, :price, :integer
  end
end
