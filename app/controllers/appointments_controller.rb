class AppointmentsController < ApplicationController

    def new
        @appointment = Appointment.new
    end

    def create
        # raise params.inspect
        @appointment = Appointment.create(appointment_params)
    end

    def show
        @appointment = Appointment.find(params[:id])
    end

    def index
        @appointments = Appointment.all
    end

    def edit
        @appointment = Appointment.find(params[:id])
    end

    def update
        @appointment =Appointment.find(params[:id])
        @appointment.update(appointment_params)
        redirect_to appointment_path(@appointment)
    end

    def destroy
        @appointment = Appointment.find(params[:id])
        @appointment.destroy
    end

    private
        def appointment_params
            params.require(:appointment).permit(:appointment_time, :vaccination_records, :haircut_type, :pet_id, :groomer_id)
        end
end
