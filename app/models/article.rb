class Article < ActiveRecord::Base

  attr_accessible :title, :short, :full, :picture, :state, :created_at, :updated_at, :course_id

  has_attached_file :picture, :styles => { :medium => "300x300>", :thumb => "100x100>" }

  #validates_attachment_presence :picture

  validates_presence_of :title, :state, :course

  belongs_to :course

  include TesterModels::StateMachine

end
