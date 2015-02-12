class AddNameToStuffs < ActiveRecord::Migration
  def change
    add_column :stuffs, :name, :string
  end
end
