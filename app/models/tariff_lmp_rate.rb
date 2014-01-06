class TariffLmpRate < ActiveRecord::Base
	belongs_to :tariff_iso_lmp

	validates :lmp_date, presence: true
	validates :lmp_time, presence: true
	validates :lmp_factor, presence: true, numericality: true
	validates :tariff_iso_lmp_id, presence: true

end
