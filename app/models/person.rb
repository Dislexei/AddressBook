class Person < ApplicationRecord
	enum salutation: {Mr:0, Mrs:1, Ms:2, Dr:3}
	has_many :emails
	has_many :phone_numbers
	has_many :addresses

	validates :firstName, presence: true, length: { minimum: 2 }
	validates :lastName, presence: true, length: { minimum: 2 }

	
end
