class Owner < ApplicationRecord
    has_many :pets
    # has_many :appointments, through: :pets
    validates :name, presence: true
    validates :email, presence: true
    validates :phone_number, presence: true
end
