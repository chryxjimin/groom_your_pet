require 'pry'
class GroomersController < ApplicationController
   

    def show
        @groomer = Groomer.find(params[:id])
    end

    def destroy
        Groomer.find(params[:id]).delete
    end


    private
        def groomer_params
            params.require(:groomer).permit(:username, :password)
        end
end
