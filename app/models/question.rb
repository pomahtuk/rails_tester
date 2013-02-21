class Question < ActiveRecord::Base

  belongs_to :test

  has_many :answers, :dependent => :delete_all

  attr_accessible :answers_attributes

  accepts_nested_attributes_for :answers, :reject_if => lambda { |a| a[:title].blank? }, :allow_destroy => true

  include TesterModels::StateMachine

end
