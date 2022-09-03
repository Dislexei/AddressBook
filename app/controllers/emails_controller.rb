class EmailsController < ApplicationController

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

  def create
    @person = Person.find(params[:person_id])
    @email = @person.emails.create(email_params)
    redirect_to person_path(@person)
  end

  # GET /emails/1/edit
  def edit
    @email = Email.find(params[:id])
  end

  def update 
    @email = Email.find(params[:id])

    if @email.update(email_params)
      redirect_to @email 
    else
      render :edit, status: :unprocessable_entity
      format.json { render json: @email.errors, status: :unprocessable_entity }
    end
  end

  def destroy
    @person = Person.find(params[:person_id])
    @email = @person.emails.find([params[:id]])
    @email.destroy
    # redirect_to person_path(@person), status: 303
  end


  

  private
    # Only allow a list of trusted parameters through.
    def email_params
      params.require(:email).permit(:email_address, :comment)
    end
end
