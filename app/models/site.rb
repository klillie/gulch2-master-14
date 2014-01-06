class Site < ActiveRecord::Base
	belongs_to :user
	has_many :site_load_profiles, dependent: :destroy

	#VALID_ZIP_REGEX = /\d{5}/ 								#zip_code
	validates :zip_code, numericality: true, 
				length: {minimum: 5, maximum: 5}
	#validates :square_feet, numericality: true
	validates :user_id, presence: true 			

	# should only be present when site is being saved	
	# validates :site_name, presence: true

	accepts_nested_attributes_for :site_load_profiles

end
