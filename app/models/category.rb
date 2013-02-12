class Category < ActiveRecord::Base

  include TheSortableTree::Scopes

  has_many :courses

  acts_as_nested_set

  attr_accessible :name, :parent_id

end
