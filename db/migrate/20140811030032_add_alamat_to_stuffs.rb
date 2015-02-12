class AddAlamatToStuffs < ActiveRecord::Migration
  def change
    add_column :stuffs, :alamat, :string
  end
end
