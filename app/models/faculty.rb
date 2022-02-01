class Faculty < ApplicationRecord
    validates :first_name, :last_name, :email, presence: true
    validates :first_name, :last_name, :email, uniqueness: true
    validates :phone, numericality: true
    validates :phone, length: {is: 10}


end
