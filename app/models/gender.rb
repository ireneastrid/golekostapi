class Gender < ActiveRecord::Base
	def self.options_for_select
  order('LOWER(gender_name)').map { |e| [e.gender_name, e.id] }
end
	 
  has_many :stuff
end
