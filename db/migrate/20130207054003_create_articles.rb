class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :title
      t.text :short
      t.text :full
      t.string :image_url
      t.string :state

      t.timestamps
    end
  end
end
