class Student < ApplicationRecord
    validates :department, inclusion: { in: %w(IT CE), message: "department can't be %{value}"}
    
    def date_of_birth_cannot_be_in_the_future
        if date_of_birth == nil
            errors.add(:date_of_birth, "can't be blank")
        elsif (date_of_birth > Date.today)
            errors.add(:date_of_birth, "can't be in the future")
        end
    end

    validates :terms_of_usage, acceptance: { message: ':You cannot proceed without accepting Terms of Usage' } 

    before_validation :normalize_name
    def normalize_name
        self.first_name = first_name.downcase.titleize
        self.last_name = last_name.downcase.titleize
    end
    before_validation :date_of_birth_cannot_be_in_the_future
    
    after_create do |student|
        puts "You have created a Student"
    end
    after_update do |student|
        puts "You have Updated a Student"
    end
    after_destroy :after_destroy_commit, if: after_destroy_commit
    def after_destroy_commit 
        puts "You have destroyed a Student"
    end
    after_find do |student|
        puts "You have found student object!"
    end
    after_save do |faculty|
        puts "Your changes has been saved"  
    end  


end 
