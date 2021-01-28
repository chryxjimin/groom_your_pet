class AppointmentsController < ApplicationController
    before_action :load_appointment, only: [:show, :edit, :update, :destroy]
    before_action :ensure_current_groomer, only: [:new, :index, :edit]

    def new
        @appointment = Appointment.new
    end

    def create
        @appointment = Appointment.new(appointment_params)
        if @appointment.save
            redirect_to appointment_path(@appointment)
        else 
            flash[:error] = "Error. Please try again."
            redirect_to new_appointment_path
        end
    end

    def show
        @owner = @appointment.pet.owner
    end

    def index
        @appointments = Appointment.all.sort_by {|app| app.time}
    end

    def edit

    end

    def update
        @appointment.update(appointment_params)
        redirect_to appointment_path(@appointment)
    end

    def destroy
        @appointment.destroy
        redirect_to appointments_path
    end

    private

        def load_appointment
            @appointment =Appointment.find(params[:id])
        end

        def ensure_current_groomer
            redirect to login_path unless current_groomer
        end

        def appointment_params
            params.require(:appointment).permit(:time, :date, :vaccination_records, :haircut_type, :pet_name, :groomer_name, :groomer_id)
        end
end
