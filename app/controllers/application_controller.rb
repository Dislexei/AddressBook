class ApplicationController < ActionController::Base
     before_action :authorize
     skip_before_action :verify_authenticity_token

     protected

          def authorize
               unless request.format == :json
                    puts "Not a JSON"
                    unless User.find_by(id: session[:user_id])
                         redirect_to login_url, notice: "You need to log in to see this page."
                    end
               else
                    puts "JSON detected"
               end
          end

          def check_ownership_for_person_children
               
               @person = Person.find(params[:person_id])  
               unless @person.user_id === session[:user_id]
                    redirect_to people_path, notice: "You do not have ownership over this person."
               end
          end
end

