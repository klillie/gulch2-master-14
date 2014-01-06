class TariffLineItems < ActiveRecord::Base
	belongs_to :tariff_tariff
	belongs_to :tariff_bill_group
	has_many :tariff_line_items, 
				foreign_key: "tariff_line_item_id"
	has_many :tariff_muni_franchise_cost,
			 	foreign_key: "tariff_line_item_id"
	has_many :tariff_stepped_rate,
			 	foreign_key: "tariff_line_item_id"
	has_many :tariff_indexed_rate,
			 	foreign_key: "tariff_line_item_id"

	validates :line_item_name, presence: true
	validates :line_item_type, presence: true
	validates :effective_date, presence: true
	#validates :line_item_rate, presence: true, unless: [:tariff_type == "Stepped" || :tariff_type == "Indexed rate"]
	validates :tou_type, presence: true
	validates :bill_group_order, presence: true
	validates :tariff_tariff_id, presence: true
	validates :tariff_season_id, presence: true
	validates :tariff_bill_group_id, presence: true

	# Pulls the applicable line item based on tariff
	def self.line_items(tariffs, date, season)
		@line_items = TariffLineItems.where('(tariff_tariff_id = ? OR tariff_tariff_id = ?) 
				AND effective_date <= ? AND (expiration_date >= ? OR expiration_date isnull)
				AND (tariff_season_id = ? OR tariff_season_id = ?)',
				tariffs[0].id, tariffs[1].id, date, date, season[0].id, season[1].id)

	end

	# need to error trap if only 1 tariff is passed 
	# (tariff type = "bundled" versus tariff type = "delivery" and "energy")


end
