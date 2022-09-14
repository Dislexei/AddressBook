class AddressesController < ApplicationController
  before_action :find_address, only: %i[ :show, :edit, :update, :destroy ]
  before_action :check_ownership_for_person_children
  # GET /addresses or /addresses.json
  def index
	@addresses = Address.all
  end

  # GET /addresses/1 or /addresses/1.json
  def show
	@address = Address.find(params[:id])
  end

  # GET /addresses/new
  def new
	@address = Address.new
  end

  # GET /addresses/1/edit
  def edit
	@person = Person.find(params[:person_id])
	@address = @person.addresses.find(params[:id])
	# @address = Address.find(params[:id])
	respond_to do |format|
	  format.js {}
	  format.html {}
	end 
  end

  def update 
	@person = Person.find(params[:person_id])
	@address = @person.addresses.find(params[:id])
	@address.update(address_params)

	respond_to do |format|
		format.js {render layout: false}
		format.html {redirect_to person_path(@person)} 
	end
  end

  # POST /addresses or /addresses.json
  def create
	@person = Person.find(params[:person_id])
	@address = @person.addresses.create(address_params)

	respond_to do |format|
		format.js { }
		format.html {redirect_to person_path(@person)} 
	end

  end

  def destroy
	@person = Person.find(params[:person_id])
	@address = Address.find(params[:id])
	@address.destroy
	respond_to do |format|
		format.js {}
		format.html {redirect_to person_path(@person)}
  end
end

  private
	# Only allow a list of trusted parameters through.
	def address_params
	  params.require(:address).permit(:street, :town, :zip_code, :state, :country)
	end

	def find_address
	  @address = Address.find(params[:id])
  end

end
