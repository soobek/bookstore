class AddDetailsToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :first_name, :string, :limit=>20
    add_column :users, :last_name, :string, :limit=>60
    add_column :users, :nick, :string, :limit=>20
    add_column :users, :user_role, :integer
  end
end
