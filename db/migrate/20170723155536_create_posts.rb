class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      
      t.string  :title
      t.text    :content
      t.string  :editor
      t.integer :grade
      t.string  :img
      t.string  :video

      t.timestamps null: false
    end
  end
end
