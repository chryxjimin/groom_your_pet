require 'pry'
class SessionsController < ApplicationController


    def home
    end

    def register
        @groomer = Groomer.new
    end

    def registered
        # binding.pry
        @groomer = Groomer.new(username: params[:groomer][:username], password: params[:groomer][:password])
        if @groomer.save
            session[:groomer_id] = @groomer.id
            redirect_to groomer_path(@groomer)
        else 
            flash[:errors] = @groomer.errors.full_messages
            render :register
        end
    end

    def login
        @groomer = Groomer.new
    end
 
    def create
        @groomer = Groomer.find_by(username: params[:groomer][:username])
        if @groomer && @groomer.authenticate(strong_params[:password])
            session[:groomer_id] = @groomer.id
            render :success
        else
            @groomer = Groomer.new(username: strong_params[:username])
            render :login
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
end
