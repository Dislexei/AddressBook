class Address < ApplicationRecord
	belongs_to :person

	validates :street, presence: true
	validates :town, presence: true
	validates :zip_code, presence: true

end
