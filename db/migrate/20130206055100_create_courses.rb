class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string :title
      t.text   :short
      t.text   :full
      t.string :state

      t.timestamps
    end
  end
end
