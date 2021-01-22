class Appointment < ApplicationRecord
    belongs_to :pet
    belongs_to :groomer
    

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

    def self.from_today
        where("date =?", Time.zone.today.beginning_of_day)
    end


    def start_time
        self.date ##Where 'start' is a attribute of type 'Date' accessible through MyModel's relationship
    end


end
