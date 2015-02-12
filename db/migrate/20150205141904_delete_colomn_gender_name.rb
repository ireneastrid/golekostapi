class DeleteColomnGenderName < ActiveRecord::Migration
  def change
  	remove_column :stuffs, :gender_name
  end
end
