class TariffTou < ActiveRecord::Base
	belongs_to :tariff_season

	validates :tou_type, presence: true
	validates :day_of_week, presence: true
	validates :start_time, presence: true
	validates :end_time, presence: true
	validates :tariff_seasons_id, presence: true

	# returns all the time of use (tou) definitions for that season based on date and zip code
	def self.tou(date, zip)
		@season = TariffSeason.season(date, zip)
		@tou = TariffTou.where('tariff_seasons_id = ?', @season[0].id)

	end

end
