class Article < ActiveRecord::Base

  attr_accessible :title, :short, :full, :image_url, :state, :created_at, :updated_at, :course_id

  belongs_to :course

  state_machine :initial => :draft do

    state :draft
    state :published
    state :deleted

    event :to_draft do 
      transition all => :draft
    end

    event :to_published do
      transition all => :published
    end  

    event :to_deleted do
      transition all => :deleted
    end 

  end

end
