class PetsController < ApplicationController
    def new
        if current_groomer
            @owner = Owner.find(params[:owner_id])
            @pet = @owner.pets.build
        else
            redirect_to owner_pets_path
        end
    end

    def create
        # binding.pry
        @pet = Pet.create(pet_params)
        if @pet.save
            @owner = Owner.find(params[:owner_id])
            redirect_to owner_pet_path(@owner, @pet)
        else
            redirect_to new_owner_pet_path, alert: "Pet was not saved"
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
            redirect_to owner_pets_path
        end
    end

    def update
        @pet = Pet.find(params[:id])
        @pet.update(pet_params)
        redirect_to owner_pet_path(@owner, @pet)
    end

    def destroy
        @pet = Pet.find(params[:id])
        @pet.destroy
        redirect_to owner_pets_path
    end

    private
        def pet_params
            params.require(:pet).permit(:name, :age, :breed, :weight, :owner_id)
        end
end
