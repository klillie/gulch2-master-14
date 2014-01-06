class TariffTariff < ActiveRecord::Base
	belongs_to :tariff_billing_class
	has_many :tariff_line_items, 
				foreign_key: "tariff_tariff_id"

	validates :tariff_name, presence: true
	validates :tariff_type, presence: true
	validates :tariff_billing_class_id, presence: true

	# Pulls the applicable tariff based on billing class
	def self.tariffs(billing_class)
		@tariffs = TariffTariff.where('tariff_billing_class_id = ?',
				billing_class[0].id)
	end
	
end
