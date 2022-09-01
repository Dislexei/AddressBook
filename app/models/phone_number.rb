class PhoneNumber < ApplicationRecord
	belongs_to :person

	validates :phonenumber, presence: true
end
