class TariffBillingClass < ActiveRecord::Base
	belongs_to :tariff_territory
	has_many :tariff_tariffs, 
				foreign_key: "tariff_billing_class_id"
	has_many :tariff_bill_group,
				foreign_key: "tariff_billing_class_id"
	validates :billing_class_name, presence: true
	validates :customer_type, presence: true
	validates :phases, presence: true
	validates :voltage, presence: true
	validates :units, presence: true
	validates :start_value, presence: true, numericality: true
	#validates :end_value, numericality: true
	validates :tariff_territory_id, presence: true

	# Pulls the billing_class based on zip_code and demand
	def self.billing_class(zip, demand, usage, phases)
		@territory = TariffTerritory.territory(zip)
		@billing_class = TariffBillingClass.where('tariff_territory_id = ? AND units = ?
				AND start_value <= ? AND (end_value > ? OR end_value isnull) AND phases = ?', 
				@territory.id, "kW", demand, demand, phases) 
		
		# If no billing class is returned based on kW, looks to find one that is returned based on kWh
		if @billing_class.count == 0
			@billing_class = TariffBillingClass.where('tariff_territory_id = ? AND units = ?
				AND start_value <= ? AND end_value > ? AND phases = ?', 
				@territory.id, "kWh", usage, usage, phases) 
		end

		return @billing_class

		# -> need to error trap when no record is returned

	end

end
