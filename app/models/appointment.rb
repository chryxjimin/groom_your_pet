class Appointment < ApplicationRecord
    belongs_to :pet
    belongs_to :groomer
    # belongs_to :owner

    def pet_name=(name)
        self.pet = Pet.find_or_create_by(name: name)
    end

    def pet_name
        self.pet ? self.pet.name : nil
    end

    def groomer_name=(username)
        self.groomer = Groomer.find_or_create_by(username: username)
    end

    def groomer_name
        self.groomer ? self.groomer.username : nil
    end

    # def owner_name=(name)
    #     self.owner = Owner.find_or_create_by(name: name)
    # end

    # def owner_name
    #     self.owner ? self.owner.name : nil
    # end


    def start_time
        self.appointment_time ##Where 'start' is a attribute of type 'Date' accessible through MyModel's relationship
    end


end
