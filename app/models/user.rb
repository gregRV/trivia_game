class User < ActiveRecord::Base
	validates :name, :email, presence: true

	has_secure_password
end
