class AddLatitudeToStuffs < ActiveRecord::Migration
  def change
    add_column :stuffs, :latitude, :float
  end
end
