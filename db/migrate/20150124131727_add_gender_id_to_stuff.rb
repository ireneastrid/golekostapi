class AddGenderIdToStuff < ActiveRecord::Migration
  def change
    add_column :stuffs, :gender_id, :integer, default: 1
  end
end
