class CreateMylists < ActiveRecord::Migration
  def change
    create_table :mylists do |t|
      
      t.string  :goal
      t.boolean :complete, default:false
      t.integer :year
      t.integer :user_id

      t.references :user, foreign_key: true
      t.timestamps null: false
    end
  end
end
