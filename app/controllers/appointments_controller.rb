class AppointmentsController < ApplicationController

    def new
        # binding.pry
        if current_groomer
            @groomer = Groomer.find(params[:groomer_id])
            @appointment = @groomer.appointments.build
        else
            redirect_to login_path
        end
    end

    def create
        # binding.pry
        @appointment = Appointment.create(appointment_params)
        if @appointment.save
            @groomer = Groomer.find(params[:groomer_id])
            redirect_to groomer_appointment_path(@groomer, @appointment)
        else 
            flash[:error] = @appointment.errors.full_messages
            redirect_to new_groomer_appointment_path
        end
    end

    def show
        @appointment = Appointment.find(params[:id])
        @owner = @appointment.pet.owner
    end

    def index
        if current_groomer
            @appointments = Appointment.all
        else
            redirect_to login_path
        end
    end

    def todays_appointments
        @appointments = Appointment.all.from_today
        binding.pry
    end

    def edit
        if current_groomer
            @appointment = Appointment.find(params[:id])
        else
            redirect_to login_path
        end
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
            params.require(:appointment).permit(:time, :date, :vaccination_records, :haircut_type, :pet_name, :groomer_name, :groomer_id)
        end
end
