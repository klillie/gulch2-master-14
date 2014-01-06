class TariffIsoLmp < ActiveRecord::Base
	has_many :tariff_indexed_rates
	has_many :tariff_lmp_rates, dependent: :destroy

	validates :iso_rto, presence: true 	
	validates :hub, presence: true 	
	validates :da_rt, presence: true 	

end
