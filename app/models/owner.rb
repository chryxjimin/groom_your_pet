class Owner < ApplicationRecord
    has_many :pets
    validates :name, presence: true
    validates :email, presence: true
    validates :phone_number, presence: true
end
