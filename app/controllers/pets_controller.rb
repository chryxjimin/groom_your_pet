class PetsController < ApplicationController

    before_action :set_owner, only: [:new, :create, :show, :index, :edit, :update, :destroy]

    def new
        @pet = Pet.new
    end

    def create
        # binding.pry
        @pet = @owner.pets.build(pet_params)
        if @pet.save
            @owner = Owner.find(params[:owner_id])
            redirect_to owner_pet_path(@owner, @pet)
        else
            flash[:error] = @pet.errors.full_messages
            redirect_to new_owner_pet_path
        end
    end

    def show
        @pet = Pet.find(params[:id])
    end

    def index
        @pets = Pet.all.sort_by {|pet| pet.name }
    end

    def edit
        @pet = Pet.find(params[:id])
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

        def set_owner
            @owner = Owner.find(params[:owner_id])
        end
end
