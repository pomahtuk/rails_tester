class Question < ActiveRecord::Base

  belongs_to :test

  has_many :answers, :dependent => :delete_all

end
