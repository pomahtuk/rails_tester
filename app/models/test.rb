class Test < ActiveRecord::Base

  belongs_to :course

  has_many :questions, :dependent => :delete_all

  attr_accessible :questions_attributes

  accepts_nested_attributes_for :questions, :reject_if => lambda { |a| a[:title].blank? }, :allow_destroy => true

  include TesterModels::StateMachine

end
