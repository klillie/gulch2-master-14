class TariffTerritoryZipCodeRel < ActiveRecord::Base
	belongs_to :tariff_territory#, class_name: "TariffTools"
	belongs_to :tariff_zip_code#, class_name: "TariffTools"

	validates :tariff_territory_id, presence: true
	validates :tariff_zip_code_id, presence: true

end
