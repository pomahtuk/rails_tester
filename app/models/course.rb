class Course < ActiveRecord::Base

  belongs_to :category

  has_many :articles

  has_many :tests

  include TesterModels::StateMachine

end
