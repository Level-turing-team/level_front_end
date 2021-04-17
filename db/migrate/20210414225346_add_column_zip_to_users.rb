class AddColumnZipToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :zip, :string
    add_column :users, :picture_url, :string
  end
end
