require 'pry'
class GroomersController < ApplicationController
   
    # def new
    #     @groomer = Groomer.new(groomer_params)
    # end

    def show
        @groomer = Groomer.find(params[:id])
    end

    # def index
    # end


    private
        def groomer_params
            params.require(:groomer).permit(:username, :password)
        end
end
