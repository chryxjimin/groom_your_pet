class PetsController < ApplicationController
    def new
        @pet = Pet.new
    end

    def create
        @pet = Pet.create(pet_params)
    end

    def show
        @pet = Pet.find(params[:id])
    end

    def index
        @pets = Pet.all.reverse 
    end

    private
        def pet_params
            params.require(:pet).permit(:name, :age, :breed, :weight, :owner_id)
        end
end
