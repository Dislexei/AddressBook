class Person < ApplicationRecord
	enum salutation: {
		Mr:  0,
		Mrs: 1,
		Ms:  2
	}, _prefix: true
	has_many :emailaddress
	has_many :phone_numbers
	has_many :addresses
	has_one :salutation
end
