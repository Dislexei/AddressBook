class OwlAddressController < ApplicationController
	def create
	    @person = Person.find(params[:person_id])
	    @owl_address = @person.owl_addresses.create(owl_addresses_params)
	    redirect_to person_path(@person)
  	end
end
