class Stuff < ActiveRecord::Base

	mount_uploader :picture , PictureUploader
	mount_uploader :picture1 , PictureUploader
	mount_uploader :picture2 , PictureUploader
	enum status: [:waiting,:confirm,:decline]
	enum gender_id: [:any, :putra,:putri]
	filterrific(
		default_settings: { sorted_by: 'created_at_desc' },
		filter_names: [
			:search_query,
			:search_gender,
			:sorted_by,
			:with_gender,
			:range,
			:price_gte,
			:price_lt
		]
		)
	def self.options_for_select
		order('LOWER(name)').map { |e| [e.alamat, e.id] }
	end

	scope :search_query, lambda { |query|

		return nil  if query.blank?

	  # condition query, parse into individual keywords
	  terms = query.downcase.split(/\s+/)

	  logger.debug(terms)

	  # replace "*" with "%" for wildcard searches,
	  # append '%', remove duplicate '%'s
	  terms = terms.map { |e|
	  	(e.gsub('*', '%') + '%').gsub(/%+/, '%').prepend('%')
	  }
	  # configure number of OR conditions for provision
	  # of interpolation arguments. Adjust this if you
	  # change the number of OR conditions.
	  num_or_conds = 1
	  where(
	  	terms.map { |term|
	  		"(LOWER(stuffs.alamat) LIKE ?)"
	  		}.join(' AND '),
	  		*terms.map { |e| [e] * num_or_conds }.flatten
	  		)
	}

	scope :search_gender, lambda { |query|

		return nil  if query.blank?

	  # condition query, parse into individual keywords
	  terms = query.downcase.split(/\s+/)

	  logger.debug(terms)
	  # replace "*" with "%" for wildcard searches,
	  # append '%', remove duplicate '%'s
	  terms = terms.map { |e|
	  	(e.gsub('*', '%') + '%').gsub(/%+/, '%').prepend('%')
	  }
	  # configure number of OR conditions for provision
	  # of interpolation arguments. Adjust this if you
	  # change the number of OR conditions.
	  num_or_conds = 1
	  where(
	  	terms.map { |term|
	  		"(LOWER(stuffs.gender_name) LIKE ?)"
	  		}.join(' AND '),
	  		*terms.map { |e| [e] * num_or_conds }.flatten
	  		)
	}


	scope :sorted_by, lambda { |sort_option|
	  # extract the sort direction from the param value.
	  direction = (sort_option =~ /desc$/) ? 'desc' : 'asc'
	  case sort_option.to_s
	  when /^created_at_/
	    # Simple sort on the created_at column.
	    order("stuffs.created_at #{ direction }")
	when /^name_/
	    # Simple sort on the name colums
	    order("LOWER(stuffs.name) #{ direction }")
	else
		raise(ArgumentError, "Invalid sort option: #{ sort_option.inspect }")
	end
}
scope :with_gender, lambda { |gender|
	where(gender: [*gender])
    # Filters students with any of the given country_ids

}

scope :price_gte, lambda { |price|
	where('stuffs.price >= ?', price)
}

# always exclude the upper boundary for semi open intervals
scope :price_lt, lambda { |price|
	where('stuffs.price < ?', price)
}

# always include the lower boundary for semi open intervals


belongs_to :gender

def self.check_expiry
		Stuff.all.each do |s|
			if Date.today < s.confirm_date.next_month
				s.status=2
			end
		end
	end




end
