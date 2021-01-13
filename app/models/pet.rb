class Pet < ApplicationRecord
    belongs_to :owner
    has_many :appointments
    has_many :groomers, through: :appointments
    validates :name, presence: true
end
