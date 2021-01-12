class PetsController < ApplicationController
    def new
        @pet = Pet.new
    end

    def create
        @pet = Pet.create(pet_params)
    end

    private
        def pet_params
            params.require(:pet).permit(:name, :age, :breed, :weight, :owner_id)
        end
end
