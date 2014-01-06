class TariffHolidays < ActiveRecord::Base
	belongs_to :tariff_territory
	
	validates :holiday_name, presence: true
	validates :holiday_date, presence: true
			# check for date format
	validates :tariff_territory_id, presence: true 			

end
