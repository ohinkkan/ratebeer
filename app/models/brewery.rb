class Brewery < ActiveRecord::Base
	has_many :beers, dependent: :destroy
	has_many :ratings, through: :beers
	validates :name, length: { minimum: 1 }
	validates :year, numericality: { greater_than_or_equal_to: 1042,  
									only_integer: true }
	validate :not_in_future

	include RatingAverage
	
	def not_in_future 
		if self.year > Time.now.year
			errors.add(:year, "can't be in the future")
		end
	end
	
	
	def print_report
		puts self.name
		puts "established at year #{year}"
		puts "number of beers #{beers.count}"
	end
	def restart
		self.year = 2015
		puts "changed year to #{year}"
	end
	

	
end
