class Student < ApplicationRecord
    validates :first_name, :last_name, presence: true
    validates :department, inclusion: { in: %w(IT CE), message: "department can't be %{value}"}
    validate :date_of_birth_cannot_be_in_the_future

    def date_of_birth_cannot_be_in_the_future
        if date_of_birth > Date.today
        errors.add(:date_of_birth, "can't be in the future")
        end
    end

    validates :terms_of_usage, acceptance: { message: 'must be accepted' } 


end
