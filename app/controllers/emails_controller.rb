class EmailsController < ApplicationController

before_action :find_email, only: %i[ :show, :edit, :update, :destroy ]
before_action :check_ownership_for_person_children
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
    respond_to do |format|
      format.js {render layout: false}
      format.html {redirect_to person_path(@person)}
    end
  end

  def edit
    @person = Person.find(params[:person_id])
    @email = @person.emails.find(params[:id])
    respond_to do |format|
      format.js {}
      format.html {}
    end 
  end

  def update 
    @person = Person.find(params[:person_id])
    @email = @person.emails.find(params[:id])
    @email.update(email_params)

    respond_to do |format|
      format.js {render layout: false}
      format.html {redirect_to person_path(@person)} 
    end
  end

  def destroy
    @person = Person.find(params[:person_id])
    @email = Email.find(params[:id])
    @email.destroy
    respond_to do |format|
      format.js {}
      format.html {}
  end
end

  private
    # Only allow a list of trusted parameters through.
    def email_params
      params.require(:email).permit(:email_address, :comment)
    end

  def find_email
    @email = Email.find(params[:id])
  end
end
