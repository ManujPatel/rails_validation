class Faculty < ApplicationRecord
    # frozen_string_literal: true
    
    validates :first_name, :last_name, :email, presence: true
    validates :phone, :email, uniqueness: true
    validates :phone, numericality: true
    validates :phone, length: {is: 10}
    validates :designation, exclusion: { in: %w(HOD Sr.Prof)}
    validates :designation, inclusion: { in: %w(Ass.Prof Prof), message: "designation can't be %{value}"}
    validate :date_of_birth_cannot_be_in_the_future

    def date_of_birth_cannot_be_in_the_future
        if date_of_birth > Date.today
        errors.add(:date_of_birth, "can't be in the future")
        end
    end
end
