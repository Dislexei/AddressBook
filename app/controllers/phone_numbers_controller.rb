class PhoneNumbersController < ApplicationController
  before_action :find_phone_number, only: %i[ :show, :edit, :update, :destroy ]

  # GET /phone_numbers or /phone_numbers.json
  def index
    @phone_numbers = phone_number.all
  end

  # GET /phone_numbers/1 or /phone_numbers/1.json
  def show
  end

  def index
    @phone_numbers = PhoneNumber.all
  end

  # GET /phone_numbers/new
  def new
    @phone_number = PhoneNumber.new
  end

  # POST /phone_numbers or /phone_numbers.json
  def create
    @person = Person.find(params[:person_id])
    @phone_number = @person.phone_numbers.create(phone_number_params)
    respond_to do |format|
      format.js {render layout: false}
      format.html {redirect_to person_path(@person)} 
    end
  end

  # GET /phone_numbers/1/edit
  def edit
    @person = Person.find(params[:person_id])
    @phone_number = @person.phone_numbers.find(params[:id])
    respond_to do |format|
      format.js {}
      format.html {}
    end 
  end

  def update 
    @person = Person.find(params[:person_id])
    @phone_number = @person.phone_numbers.find(params[:id])
    @phone_number.update(phone_number_params)

    respond_to do |format|
      format.js {render layout: false}
      format.html {redirect_to person_path(@person)} 
    end
  end

  def destroy
  @person = Person.find(params[:person_id])
  @phone_number = PhoneNumber.find(params[:id])
  @phone_number.destroy
  respond_to do |format|
    format.js {}
    format.html {}
  end
end

   private
    # Only allow a list of trusted parameters through.
    def phone_number_params
      params.require(:phone_number).permit(:phone_number, :comment)
    end
    
    def find_phone_number
      @phone_number = PhoneNumber.find(params[:id])
  end
end
