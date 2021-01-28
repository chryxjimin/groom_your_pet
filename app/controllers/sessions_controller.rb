require 'pry'
class SessionsController < ApplicationController


    def home
    end

    def register
        @groomer = Groomer.new
    end

    def registered
        @groomer = Groomer.new(strong_params)
        if @groomer.save
            session[:groomer_id] = @groomer.id
            redirect_to groomer_path(@groomer)
        else 
            flash[:error] = @groomer.errors.full_messages
            redirect_to register_path
        end
    end

    def login
        @groomer = Groomer.new
    end
 
    def create
        if auth_hash != nil
            @groomer = Groomer.find_or_create_from_auth_hash(auth_hash)
            session[:groomer_id] = @groomer.id
            redirect_to groomer_appointments_path(@groomer)
        else
            @groomer = Groomer.find_by(username: params[:groomer][:username])

            if @groomer && @groomer.authenticate(strong_params[:password])
                @appointments = @groomer.appointments.from_today
                session[:groomer_id] = @groomer.id
                render :success
            else
                @groomer = Groomer.new(username: strong_params[:username])
                render :login
            end
        end
    end

    def logout
        session.clear
        render :'/sessions/home'
    end

    private
        
        def strong_params
            params.require(:groomer).permit(:username, :password)
        end

        def auth_hash
            request.env['omniauth.auth']
        end
end
  