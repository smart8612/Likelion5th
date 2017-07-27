class CreateMylists < ActiveRecord::Migration
  def change
    create_table :mylists do |t|
      
      t.string  :goal
      t.boolean :complete
      t.string  :editor
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
