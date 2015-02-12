class RenamePricetoNumber < ActiveRecord::Migration
  def self.up
    change_column :suffs, :price, :decimal
  end

  def self.down
    change_column :suffs, :price, :integer
  end
end
