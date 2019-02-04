class CreateMyplans < ActiveRecord::Migration
  def change
    create_table :myplans do |t|

      t.string :plan
      t.boolean :sub_complete, default:false
      t.integer :mylist_id
      t.string :editor
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
