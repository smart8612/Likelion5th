class CreateReplies < ActiveRecord::Migration
  def change
    create_table :replies do |t|
      
      t.string  :dbEditor
      t.text    :dbContent
      t.integer :post_id
      
      t.references :User, foreign_key: true
      
      t.timestamps null: false
    end
  end
end
