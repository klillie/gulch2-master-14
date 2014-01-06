class TariffUtility < ActiveRecord::Base
	has_many :tariff_territory
	validates :utility_name, presence: true
	validates :state, presence: true, length: { minimum: 2, maximum: 2 }

	# Pulls the utility based on a zip code
	def self.utility(zip)
		@territory = TariffTerritory.territory(zip)
		@utility = TariffUtility.find_by(id: @territory.tariff_utility_id )
	end

end
