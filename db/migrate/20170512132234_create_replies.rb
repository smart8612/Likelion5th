class CreateReplies < ActiveRecord::Migration
  def change
    create_table :replies do |t|
      t.references :post, index: true, foreign_key: true
      
      t.string  :dbEditor
      t.text    :dbContent
      
      t.timestamps null: false
    end
  end
end
