class ApplicationController < ActionController::Base
    helper_method :current_groomer, :logged_in?

    def current_groomer
        @groomer ||= Groomer.find_by(id: session[:groomer_id]) if session[:groomer_id]
    end

    def logged_in?
        # binding.pry
        !!current_groomer
    end

    # def current_owner
    #     @owner ||= owner.find_by(id: session[:owner_id]) if session[:owner_id]
    # end
end
