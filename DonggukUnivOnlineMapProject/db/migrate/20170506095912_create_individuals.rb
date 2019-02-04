class CreateIndividuals < ActiveRecord::Migration
  def change
    create_table :individuals do |t|

      t.string :myname
      t.string :email
      t.string :nickname
      t.string :password
      t.integer :phonenumber
      t.string :jobcategory
      t.string :interest1
      t.string :interest2
      t.string :interest3
      t.timestamps null: false
    end
  end
end