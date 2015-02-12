class AddLongitudeToStuffs < ActiveRecord::Migration
  def change
    add_column :stuffs, :longitude, :float
  end
end
