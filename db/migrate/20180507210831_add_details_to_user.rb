class AddDetailsToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :name, :string
    add_column :users, :date_of_birth, :date
    add_column :users, :gender, :integer
    add_column :users, :profile_picture, :string
  end
end
