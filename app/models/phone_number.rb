class PhoneNumber < ApplicationRecord
	belongs_to :person
	validates_format_of :phone_number, :with => /\A[0-9]+\z/, :message => "Phone number has to be numeric only"
end
