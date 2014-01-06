class UsageFetcher < ActiveRecord::Base
	validates :account_no, presence: true
	validates :zip_code, numericality: true, 
				length: {minimum: 5, maximum: 5}

	def self.zip_code(zip)
		@zip_code = TariffZipCode.find_by(zip_code: zip)

	end

end
