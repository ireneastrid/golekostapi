class CreateGenders < ActiveRecord::Migration
  def change
    create_table :genders do |t|
    	add_column :genders, :id, :integer
    	add_column :genders, :name, :string

      t.timestamps
    end
  end
end
