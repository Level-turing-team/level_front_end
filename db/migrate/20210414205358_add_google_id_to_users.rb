class AddGoogleIdToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :google_id, :string
  end
end
