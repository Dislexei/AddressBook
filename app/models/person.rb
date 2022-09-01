class Person < ApplicationRecord
	enum salutation: {Mr:0, Mrs:1, Ms:2, Dr:3}
	has_many :emails
	has_many :phone_numbers
	has_many :addresses

	validates :first_name, presence: true, length: { minimum: 2 }
	validates :last_name, presence: true, length: { minimum: 2 }

	
end
