class OwnersController < ApplicationController
    def new
        @owner = Owner.new
    end

    def create
        @owner = Owner.create(owner_params)
    end

    private
        def owner_params
            params.require(:owner).permit(:name, :email, :phone_number)
        end
end
