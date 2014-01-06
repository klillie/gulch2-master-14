class TariffMuniFranchiseCost < ActiveRecord::Base
	belongs_to :tariff_line_items
	
	validates :fca_city, presence: true
	validates :fca_rate, presence: true, numericality: true
	validates :tariff_line_item_id, presence: true

end
