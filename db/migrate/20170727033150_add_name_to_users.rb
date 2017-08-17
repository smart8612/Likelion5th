class AddNameToUsers < ActiveRecord::Migration
  def change
    add_column :users, :name, :string
    add_column :users, :date_of_birth, :datetime
    add_column :users, :gender, :string
    add_column :users, :profile_intro, :string
    add_column :users, :profile_img, :string
  end
end
