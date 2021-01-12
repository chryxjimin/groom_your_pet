class GroomersController < ApplicationController
    def new
        @groomer = Groomer.new
    end

    def create
        @groomer = Groomer.create(groomer_params)
    end

    private
        def groomer_params
            params.require(:groomer).permit(:appointment_time, :vaccination_records, :haircut_type, :pet_id, :groomer_id)
        end
end
