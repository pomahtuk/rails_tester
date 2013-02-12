class Course < ActiveRecord::Base

  #include ActiveRecord::StateMachine

  belongs_to :category

  has_many :articles

  has_many :tests

  state_machine :initial => :draft do

    state :draft
    state :published
    state :deleted

    event :to_draft do 
      transition all => :blocked
    end

    event :to_published do
      transition all => :published
    end  

    event :to_deleted do
      transition all => :deleted
    end 

  end

end
