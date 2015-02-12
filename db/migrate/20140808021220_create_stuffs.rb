class CreateStuffs < ActiveRecord::Migration
  def change
    create_table :stuffs do |t|
      t.string :price
      t.string :desc
      t.string :picture
      t.string :nohp

      t.timestamps
    end
  end
end
