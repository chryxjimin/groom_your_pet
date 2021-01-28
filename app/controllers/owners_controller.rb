class OwnersController < ApplicationController


    def new
        @owner = Owner.new
    end

    def create
        @owner = Owner.new(owner_params)
        if @owner.save
            redirect_to owner_path(@owner)
        else
            redirect_to new_owner_path
        end
    end

    def index
        @owners = Owner.all.sort_by { |owner| owner.name } 
    end

    def show 
        @owner = Owner.find(params[:id])
        @pets = @owner.pets
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


    private
        def owner_params
            params.require(:owner).permit(:name, :email, :phone_number)
        end
end
