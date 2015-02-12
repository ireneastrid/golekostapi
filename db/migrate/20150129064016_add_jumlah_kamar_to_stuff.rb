class AddJumlahKamarToStuff < ActiveRecord::Migration
  def change
    add_column :stuffs, :jumlahKamar, :integer
    add_column :stuffs, :jumlahWC, :integer
    add_column :stuffs, :namaAnda, :string
    add_column :stuffs, :email, :string
  end
end
