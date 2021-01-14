class Groomer < ApplicationRecord
    has_secure_password
    has_many :appointments
    has_many :pets, through: :appointments
    validates :username, presence: true
    validates :password, presence: true

   
end
