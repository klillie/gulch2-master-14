class User < ActiveRecord::Base
	has_many :sites

	before_save { self.email = email.downcase }
	before_create :create_remember_token
	
	#first_name
	validates :first_name, presence: true									
	#last_name
	validates :last_name, presence: true									
	#email
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i 				
	validates :email, presence: true, format: { with: VALID_EMAIL_REGEX },	
					uniqueness: { case_sensitive: false }					
	#phone
	VALID_PHONE_REGEX = /\(?[\d]{3}\)?[\s\.-]?[\d]{3}[\s\.-]?[\d]{4}/		
		#REGEX doesn't handle including a leading "1"
	validates :phone, presence: true, format: { with: VALID_PHONE_REGEX }	
	#company
	validates :company, presence: true										
	#address
	#city
	#state
	VALID_STATE_REGEX = /[a-z]{2}/i
	validates :state, format: { with: VALID_STATE_REGEX }
	#zip
	VALID_ZIP_REGEX = /\d{5}/
	validates :zip, format: { with: VALID_ZIP_REGEX }
	has_secure_password
	validates :password, length: { minimum: 6 }

	def User.new_remember_token
		SecureRandom.urlsafe_base64
	end

	def User.encrypt(token)
		Digest::SHA1.hexdigest(token.to_s)
	end
	
	def send_password_reset
		generate_token(:password_reset_token)
		self.password_reset_sent_at = Time.zone.now
		save!(:validate => false)
		UserMailer.password_reset(self).deliver
	end

	def generate_token(column)
		begin
			self[column] = SecureRandom.urlsafe_base64
		end while User.exists?(column => self[column])
	end

	private

		def create_remember_token
			self.remember_token = User.encrypt(User.new_remember_token)
		end

end
