class TariffSettlementLoadProfile < ActiveRecord::Base
	belongs_to :tariff_load_class

	validates :slp_date, presence: true
	validates :slp_time, presence: true
	validates :slp_factor, presence: true, numericality: true
	validates :tariff_load_class_id, presence: true

end
