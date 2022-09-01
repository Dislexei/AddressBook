class Email < ApplicationRecord
	belongs_to :person

	validates :email_address, presence: true
end
