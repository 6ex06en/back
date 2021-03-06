class User < ActiveRecord::Base
	validates :name, length: { minimum: 3, maximum: 20 }
	validates :email, presence: true, confirmation: true, uniqueness: { case_sensitive: false }
	validates :password, length: {minimum: 8}, on: :create
	validates :password_confirmation, presence: true, on: :create
	has_secure_password
	before_create :create_auth_token 

def User.new_token
	SecureRandom.urlsafe_base64
end

def User.encrypt(token)
	Digest::SHA1.hexdigest(token.to_s)
end

private

def create_auth_token
	self.auth_token = User.encrypt(User.new_token)
end
end
