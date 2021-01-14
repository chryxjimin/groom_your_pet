class GroomersController < ApplicationController
    def new
        @groomer = Groomer.new
    end

    def create
        @groomer = Groomer.create(groomer_params)
        if @groomer.save
            redirect_to groomer_path(@groomer)
        else 
            render :home
        end
    end

    def show
        @groomer = Groomer.find(params[:id])
    end


    private
        def groomer_params
            params.require(:groomer).permit(:username, :password)
        end
end
