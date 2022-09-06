class AddressesController < ApplicationController
  before_action :set_address, only: %i[ show edit update destroy ]

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
    @address = Address.find(params[:id])
  end

  def update 
    @address = Address.find(params[:id])

    if @address.update(address_params)
      redirect_to @address 
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # POST /addresses or /addresses.json
  def create
    @person = Person.find(params[:person_id])
    @address = @person.addresses.create(address_params)
    redirect_to person_path(@person)
  end

  private
    # Only allow a list of trusted parameters through.
    def address_params
      params.require(:address).permit(:street, :town, :zip_code, :state, :country)
    end
end
