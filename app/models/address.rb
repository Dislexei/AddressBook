class Address < ApplicationRecord
	belongs_to :person

	validates :street, presence: true
	validates :town, presence: true
	validates :zip_code, presence: true

	validates :country, inclusion: { in: ISO3166::Country.all.map(&:alpha2) }

	def country_name
    		country = ISO3166::Country[self.country]
    		country.translations[I18n.locale.to_s] || country.common_name || country.iso_short_name
  	end

end
