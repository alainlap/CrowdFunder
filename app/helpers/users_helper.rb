module UsersHelper

	def days_remaining(end_date)
		distance_of_time_in_words(DateTime.now, end_date).to_s.capitalize
	end

end


