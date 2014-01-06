class TariffSteppedRates < ActiveRecord::Base
	belongs_to :tariff_line_items
	has_many :tariff_line_items, 
				foreign_key: "tariff_line_item_id"

	validates :stepped_rates_unit, presence: true
	validates :stepped_rates_start, presence: true, numericality: true

	validates :tariff_line_item_id, presence: true


	# Pulls the applicable stepped rates based on the line item
	def self.stepped_rates(line_item_id)
		@stepped_rates = TariffSteppedRates.where('tariff_line_item_id = ?',
			line_item_id)

	end

end
