class Email < ApplicationRecord
	belongs_to :person

	# validates :email_address, presence: true
	validates_format_of :email_address, :with => /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/
end
