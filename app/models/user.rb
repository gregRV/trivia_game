class User < ActiveRecord::Base
	validates :name, :email, presence: true

	has_many :decks

	has_secure_password
end
