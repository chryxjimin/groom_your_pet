class PetsController < ApplicationController
    def new
        @pet = Pet.new
    end

    def create
        @pet = Pet.create(pet_params)
        if @pet.save
            redirect_to pet_path(@pet)
        else
            redirect_to new_pet_path
        end
    end

    def show
        @pet = Pet.find(params[:id])
    end

    def index
        @pets = Pet.all.sort_by {|pet| pet.name }
    end

    def edit
        if current_groomer
            @pet = Pet.find(params[:id])
        else
            redirect_to pet_path
        end
    end

    def update
        @pet = Pet.find(params[:id])
        @pet.update(pet_params)
        redirect_to pet_path(@pet)
    end

    def destroy
        @pet = Pet.find(params[:id])
        @pet.destroy
        redirect_to pets_path
    end

    private
        def pet_params
            params.require(:pet).permit(:name, :age, :breed, :weight, :owner_id)
        end
end
