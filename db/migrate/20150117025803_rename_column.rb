class RenameColumn < ActiveRecord::Migration
  def change
  	change_table :Stuffs do |t|
      t.rename :gender, :gender_name
  end
  end
end
