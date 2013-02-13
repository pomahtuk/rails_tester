class Article < ActiveRecord::Base

  attr_accessible :title, :short, :full, :picture, :state, :created_at, :updated_at, :course_id

  has_attached_file :picture, :styles => { :medium => "300x300>", :thumb => "100x100>" }

  validates_attachment_presence :picture

  validates_presence_of :title, :state, :course

  belongs_to :course

  state_machine :initial => :draft do
    event :publish do
      transition :draft => :published
    end
    
    event :unpublish do
      transition :published => :draft
    end
  end

  # state_machine :initial => :draft do

  #   state :draft
  #   state :published
  #   state :deleted

  #   event :to_draft do 
  #     transition all => :draft
  #   end

  #   event :to_published do
  #     transition all => :published
  #   end  

  #   event :to_deleted do
  #     transition all => :deleted
  #   end 

  # end

end
