class Faculty < ApplicationRecord
    validates :first_name, :last_name, :email, presence: true
    validates :first_name, :last_name, :email, uniqueness: true
    validates :phone, numericality: true
    validates :phone, length: {is: 10}

<<<<<<< Updated upstream
=======
    def date_of_birth_cannot_be_in_the_future
        if date_of_birth > Date.today
        errors.add(:date_of_birth, "can't be in the future")
        end
    end
    
    before_validation :normalize_name
    def normalize_name
        self.first_name = first_name.downcase.titleize
        self.last_name = last_name.downcase.titleize
    end
    after_create do |faculty|
        puts "You have created a Faculty"
    end
    after_update do |faculty|
        puts "You have Updated a Faculty"
    end
    after_destroy do |faculty|
        puts "You have Destroyed a Faculty"
    end
    after_validation do |faculty|
        puts "Your date of birth is validated"
    end
    after_commit do |faculty|
        puts "Your Email is Validated"
    end
    after_save do |faculty|
        puts "Your changes has been saved"  
    end  
>>>>>>> Stashed changes

end
