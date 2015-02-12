class ChangePriceToString < ActiveRecord::Migration
  def change
  		change_column :stuffs, :price, :string
  end
end
