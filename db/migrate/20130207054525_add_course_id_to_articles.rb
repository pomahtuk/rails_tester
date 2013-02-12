class AddCourseIdToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :course_id, :integer
  end
end
