class ApplicationController < ActionController::Base
    helper_method :current_groomer, :logged_in?

    def current_groomer
        Groomer.find_by(id: session[:groomer_id]) if session[:groomer_id]
    end

    def logged_in?
        !!current_groomer
    end

end
