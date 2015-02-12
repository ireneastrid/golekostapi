class AddConfirmDateTableStuff < ActiveRecord::Migration
  def change
  	add_column :stuffs, :confirm_date, :datetime
  end
end
