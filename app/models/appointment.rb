class Appointment < ApplicationRecord
    belongs_to :pet
    belongs_to :groomer

    def pet_name=(name)
        self.pet = Pet.find_or_create_by(name: name)
    end

    def pet_name
        self.pet ? self.pet.name : nil
    end

    def start_time
        self.appointment_time ##Where 'start' is a attribute of type 'Date' accessible through MyModel's relationship
    end


end
