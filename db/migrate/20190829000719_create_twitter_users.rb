class CreateTwitterUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :twitter_users do |t|
      t.string :name
      t.string :page_address

      t.timestamps
    end
  end
end
