class SessionsController < ApplicationController

    def new
       
    end

    def create
        @groomer = Groomer.create(strong_params)
    end
 
    def home

    end

    def logout
        session.clear
        render :'/sessions/home'
    end

    private
    def strong_params
        params.require(:groomer).permit(:appointment_time, :vaccination_records, :haircut_type, :pet_id, :groomer_id)
    end
end
