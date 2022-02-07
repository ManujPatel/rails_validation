class Faculty < ApplicationRecord
    validates :first_name, :last_name, :email, presence: true
    validates :phone, :email, uniqueness: true
    validates :phone, numericality: true
    validates :phone, length: {is: 10}
    validates :designation, exclusion: { in: %w(HOD Sr.Prof)}
    validates :designation, inclusion: { in: %w(Ass.Prof Prof), message: "designation can't be %{value}"}

    def date_of_birth_cannot_be_in_the_future
        if date_of_birth == nil
            errors.add(:date_of_birth, "can't be blank")
        elsif (date_of_birth > Date.today)
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
    after_destroy :after_destroy_commit, if: after_destroy_commit
    def after_destroy_commit 
        puts "You have destroyed a Faculty"
    end
    after_validation :date_of_birth_cannot_be_in_the_future
    after_commit do |faculty|
        puts "Your Email is Validated"
    end
    after_save do |faculty|
        puts "Your changes has been saved"  
    end  

end
