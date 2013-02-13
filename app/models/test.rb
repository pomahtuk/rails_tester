class Test < ActiveRecord::Base

  belongs_to :course

  has_many :questions, :dependent => :delete_all

  attr_accessible :questions_attributes

  accepts_nested_attributes_for :questions, :reject_if => lambda { |a| a[:title].blank? }, :allow_destroy => true

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
