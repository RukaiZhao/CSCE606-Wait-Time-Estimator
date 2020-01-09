class Patient < ApplicationRecord 
    validates :name, presence: true
    validates :number, uniqueness: true
    validates :number, presence: true
    validates :number, length: { is: 10 }
    # validates :number, numericality: { only_integer: true } 
    validate do |patient|
        patient.errors.add(:number, " should only contain 0-9 digits") if !/\A\d+\z/.match(patient.number)
    end
end
