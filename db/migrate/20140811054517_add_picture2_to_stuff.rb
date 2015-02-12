class AddPicture2ToStuff < ActiveRecord::Migration
  def change
    add_column :stuffs, :picture2, :string
  end
end
