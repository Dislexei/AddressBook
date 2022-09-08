class PeopleController < ApplicationController

prepend_before_action :find_person, only: [:edit, :show, :destroy]
before_action :check_ownership, only: [:edit, :update, :show, :destroy]

  def index
    @people = Person.where(user_id: session[:user_id])
  end

  def show
    @person = Person.find(params[:id])
    @address = Address.new
    @phone_number = PhoneNumber.new
    @email = Email.new
  end

  def new
    @person = Person.new
  end

  def create
    @person = Person.new(person_params)

      if @person.save
        redirect_to @person
      else
        render :new, status: :unprocessable_entity
      end
  end
  
  def edit
    @person = Person.find(params[:id])
  end

  def update
    @person = Person.find(params[:id])

    if @person.update(person_params)
      redirect_to @person
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def edit
  end

  def destroy
    @person.destroy
    redirect_to root_path, status: :see_other
  end

  private
    # Only allow a list of trusted parameters through.
    def person_params
      params.require(:person).permit(:user_id, :first_name, :last_name, :salutation, :middle_name, :ssn, :birth_date, :comment)
    end

    def find_person
        @person = Person.find(params[:id])
    end

    def check_ownership
      @person = Person.find(params[:id])  
        unless @person.user_id === session[:user_id]
          redirect_to people_path, notice: "You do not have ownership over this person."
        end
    end
  
end
