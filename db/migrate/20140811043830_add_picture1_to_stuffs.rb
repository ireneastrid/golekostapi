class AddPicture1ToStuffs < ActiveRecord::Migration
  def change
    add_column :stuffs, :picture1, :string
  end
end
