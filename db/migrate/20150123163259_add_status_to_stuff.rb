class AddStatusToStuff < ActiveRecord::Migration
  def change
    add_column :stuffs, :status, :integer, default: 0
  end
end
