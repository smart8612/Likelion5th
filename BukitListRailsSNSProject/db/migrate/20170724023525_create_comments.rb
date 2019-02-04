class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      
      t.string  :image
      t.text    :content
      t.string  :editor
      t.integer :post_id
      
      t.references :post, foreign_key: true
      t.references :user, foreign_key: true
      t.timestamps null: false
    end
  end
end
