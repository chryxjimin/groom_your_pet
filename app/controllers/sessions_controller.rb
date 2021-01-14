class SessionsController < ApplicationController

    def register
        @groomer = Groomer.new
    end

    def registered
        @groomer = Groomer.create(strong_params)
        if @groomer.save
            session[:groomer_id] = @groomer.id
            redirect_to groomer_path(@groomer)
        else 
            flash[:errors] = @groomer.errors.full_messages
            render :'/groomers/new'
        end
    end
 
    def home

    end

    def logout
        session.clear
        render :'/sessions/home'
    end

    private
    def strong_params
        params.require(:groomer).permit(:username, :password)
    end
end
