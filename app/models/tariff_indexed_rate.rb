class TariffIndexedRate < ActiveRecord::Base
	belongs_to :tariff_line_item
	belongs_to :tariff_iso_lmp

	validates :additional_charge, numericality: true
	validates :tariff_line_item_id, presence: true
	validates :tariff_iso_lmp_id, presence: true 			

end
