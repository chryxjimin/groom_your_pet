class SessionsController < ApplicationController

    def register

    end

    def create
        @groomer = Groomer.create(strong_params)
    end

    def new
       
    end
 
    def home

    end

    private
    def strong_params
        params.require(:groomer).permit(:appointment_time, :vaccination_records, :haircut_type, :pet_id, :groomer_id)
    end
end
