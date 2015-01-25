class Beer < ActiveRecord::Base
	belongs_to :brewery
	has_many :ratings
	def average_rating
		

		sum = ratings.inject(0.0) { |sum, r| sum + r.score }
		

		return (sum / ratings.count).to_f

 	end
end
