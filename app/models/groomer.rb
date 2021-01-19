class Groomer < ApplicationRecord
    has_secure_password
    has_many :appointments, dependent: :destroy
    has_many :pets, through: :appointments
    validates :username, presence: true, uniqueness: true
    validates :password_digest, presence: true, uniqueness: true

    def self.find_or_create_from_auth_hash(auth_hash)
        @groomer = Groomer.find_by(username: auth_hash.uid)

        if @groomer
            @groomer
        else
            @groomer = Groomer.create(username: auth_hash.uid, password: SecureRandom.hex)
        end
    end
   
end
