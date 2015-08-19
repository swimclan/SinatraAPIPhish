class Song < ActiveRecord::Base

	def to_s
		"#{self.name} was released on #{self.release_date}"
	end

end
