class Student < ApplicationRecord
    validates :first_name, :last_name, presence: true, on: [ :create, :update ]
    validates :department, inclusion: { in: %w(IT CE), message: "department can't be %{value}"}
    validate :date_of_birth_cannot_be_in_the_future, on: [ :create, :update ]

    def date_of_birth_cannot_be_in_the_future
        if date_of_birth > Date.today
        errors.add(:date_of_birth, "can't be in the future")
        end
    end

    validates :terms_of_usage, acceptance: { message: 'You cannot proceed without accepting Terms of Usage' } 


    after_create do |student|
        puts "You have created an object"
      end
end