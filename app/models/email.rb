class Email < ApplicationRecord
	belongs_to :person

	validates_format_of :email_address, :with => /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/
end
