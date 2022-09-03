class PhoneNumbersController < ApplicationController
  before_action :set_phone_number, only: %i[ show edit update destroy ]

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

  # GET /phone_numbers/1/edit
  def edit
    @phone_number = PhoneNumber.find(params[:id])
  end

  def update 
    @phone_number = PhoneNumber.find(params[:id])

    if @phone_number.update(phone_number_params)
      redirect_to @phone_number 
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # POST /phone_numbers or /phone_numbers.json
  def create
    @person = Person.find(params[:person_id])
    @phone_number = @person.phone_numbers.create(phone_number_params)
    redirect_to person_path(@person)
  end

   private
    # Only allow a list of trusted parameters through.
    def phone_number_params
      params.require(:phone_number).permit(:phone_number, :comment)
    end
end
