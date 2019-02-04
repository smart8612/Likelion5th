class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      
      t.string  :title
      t.text    :content
      t.string  :editor
      t.integer :grade
      t.string  :video
      t.integer :user_id
      t.integer :year
      t.integer :month
      t.integer :day
      
      t.references :user, foreign_key: true
      t.timestamps null: false
    end
  end
end
