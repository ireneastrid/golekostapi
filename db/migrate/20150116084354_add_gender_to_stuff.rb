class AddGenderToStuff < ActiveRecord::Migration
  def change
    add_column :stuffs, :gender, :string
  end
end
