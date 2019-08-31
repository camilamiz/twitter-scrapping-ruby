class AddColumnsToTwitterUser < ActiveRecord::Migration[5.2]
  def change
    add_column :twitter_users, :username, :string
    add_column :twitter_users, :description, :string
  end
end
