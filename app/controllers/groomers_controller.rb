class GroomersController < ApplicationController
    
    
    def show
        @groomer = Groomer.find(params[:id])
    end


    private
        def groomer_params
            params.require(:groomer).permit(:username, :password)
        end
end
