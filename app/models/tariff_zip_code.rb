class TariffZipCode < ActiveRecord::Base
	has_many :tariff_territory_zip_code_rel,
				foreign_key: "tariff_zip_code_id"

	validates :zip_code, numericality: true, 
				length: {minimum: 5, maximum: 5}

	def self.zip_code(zip)
		@zip_code = TariffZipCode.find_by(zip_code: zip)

	end
	

end
