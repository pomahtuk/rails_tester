class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :title
      t.string :question_type
      t.string :type
      t.text :content

      t.timestamps
    end
  end
end
