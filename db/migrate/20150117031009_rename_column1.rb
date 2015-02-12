class RenameColumn1 < ActiveRecord::Migration

	def change
		change_table :genders do |t|
			t.rename :name, :gender_name
		end
	end
end
