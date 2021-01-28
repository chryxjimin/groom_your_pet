class AppointmentsController < ApplicationController

    def new
        if current_groomer
            # @groomer = Groomer.find(params[:groomer_id])
            # @appointment = @groomer.appointments.build
            @appointment = Appointment.new
        else
            redirect_to login_path
        end
    end

    def create
        # binding.pry
        # @groomer = Groomer.find(params[:groomer_id])
        @appointment = Appointment.new(appointment_params)
        if @appointment.save
            redirect_to appointment_path(@appointment)
        else 
            flash[:error] = "Error. Please try again."
            redirect_to new_appointment_path
        end
    end

    def show
        @appointment = Appointment.find(params[:id])
        @owner = @appointment.pet.owner
    end

    def index
        if current_groomer
            # @groomer = Groomer.find(params[:groomer_id])
            @appointments = Appointment.all.sort_by {|app| app.time}
        else
            redirect_to login_path
        end
    end

    def edit
        if current_groomer
            # @groomer = Groomer.find(params[:groomer_id])
            @appointment = Appointment.find(params[:id])
        else
            redirect_to login_path
        end
    end

    def update
        @appointment =Appointment.find(params[:id])
        @appointment.update(appointment_params)
        redirect_to appointment_path(@appointment)
    end

    def destroy
        @appointment = Appointment.find(params[:id])
        @appointment.destroy
        redirect_to appointments_path
    end

    private
        def appointment_params
            params.require(:appointment).permit(:time, :date, :vaccination_records, :haircut_type, :pet_name, :groomer_name, :groomer_id)
        end
end
