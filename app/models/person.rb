class Person < ApplicationRecord
	belongs_to :user

	enum salutation: {Mr:0, Mrs:1, Ms:2, Dr:3}
	has_many :emails, dependent: :destroy
	has_many :phone_numbers, dependent: :destroy
	has_many :addresses, dependent: :destroy

	# validates :user_id, presence: true
	validates :first_name, presence: true, length: { minimum: 2 }
	validates :last_name, presence: true, length: { minimum: 2 }
	validates :ssn, format: { with: /\d{3}-\d{2}-\d{4}/, message: "SSN must be numeric with format ###-##-####" }, allow_blank: true
end
