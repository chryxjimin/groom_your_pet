class AppointmentsController < ApplicationController

    def new
        @appointment = Appointment.new
        # @groomer = Groomer.find(params[:id])
    end

    def create
        # raise params.inspect
        @appointment = Appointment.create(appointment_params)
        if @appointment.save
            redirect_to groomer_appointment_path(@appointment)
        else 
            flash[:error] = @appointment.errors.full_messages
            redirect_to new_groomer_appointment_path
        end
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
        redirect_to groomer_appointment_path(@appointment)
    end

    def destroy
        @appointment = Appointment.find(params[:id])
        @appointment.destroy
        redirect_to groomer_appointments_path
    end

    private
        def appointment_params
            params.require(:appointment).permit(:appointment_time, :vaccination_records, :haircut_type, :pet_name, :groomer_id)
        end
end
