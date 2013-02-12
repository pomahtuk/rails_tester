class CreateTests < ActiveRecord::Migration
  def change
    create_table :tests do |t|
      t.string :title
      t.text :short
      t.string :state

      t.timestamps
    end
  end
end
