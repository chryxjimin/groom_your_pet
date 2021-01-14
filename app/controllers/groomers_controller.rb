class GroomersController < ApplicationController
    def new
        @groomer = Groomer.new
    end

    def create
        @groomer = Groomer.create(groomer_params)
        if @groomer.save
            session[:groomer_id] = @groomer.id
            redirect_to groomer_path(@groomer)
        else 
            flash[:errors] = @groomer.errors.full_messages
            render :'/groomers/new'
        end
    end


    private
        def groomer_params
            params.require(:groomer).permit(:username, :password)
        end
end
