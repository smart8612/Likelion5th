class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      
      t.date    :bookdate
      t.time    :booktime
      t.string  :bookplace
      t.string  :bookpeople
      t.text    :booktext
      
      t.string  :category
      t.string  :building_name
      t.string  :hashtag
      
      t.timestamps null: false
    end
  end
end
