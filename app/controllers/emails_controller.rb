class EmailsController < ApplicationController
  before_action :set_email, only: %i[ show edit update destroy ]

  # GET /emails or /emails.json
  def index
    @emails = Email.all
  end

  # GET /emails/1 or /emails/1.json
  def show
  end

  # GET /emails/new
  def new
    @email = Email.new
  end

  # GET /emails/1/edit
  def edit
  end

  def create
    @person = Person.find(params[:person_id])
    @email = @person.emails.create(email_params)
    redirect_to person_path(@person)
  end

  private
    # Only allow a list of trusted parameters through.
    def email_params
      params.require(:email).permit(:email_address, :comment)
    end
end
