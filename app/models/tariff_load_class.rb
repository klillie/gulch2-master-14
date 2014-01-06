class TariffLoadClass < ActiveRecord::Base
	belongs_to :tariff_territory
	
	validates :load_class_name, presence: true
	validates :customer_type, presence: true
	validates :voltage, presence: true
	validates :load_class_units, presence: true
	validates :load_class_start, presence: true, numericality: true
	validates :tariff_territory_id, presence: true


end
