class OwnersController < ApplicationController
    def new
        @owner = Owner.new
    end

    def create
        @owner = Owner.create(owner_params)
        if @owner.save
            redirect_to owner_path(@owner)
        else
            redirect_to new_owner_path
        end
    end

    def show 
        @owner = Owner.find(params[:id])
        @pet = Pet.new
        if @owner.id == @pet.owner_id
            @pet
        end
    end

    def edit
        if current_groomer
            @owner = Owner.find(params[:id])
        else
            redirect_to login_path
        end
    end

    def update
        @owner = Owner.find(params[:id])
        @owner.update(owner_params)
        redirect_to owner_path(@owner)
    end



    def index
        # binding.pry
        @owners = Owner.all.sort_by { |owner| owner.name } 
    end

    private
        def owner_params
            params.require(:owner).permit(:name, :email, :phone_number)
        end
end
