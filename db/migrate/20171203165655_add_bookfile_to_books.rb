class AddBookfileToBooks < ActiveRecord::Migration[5.1]
  def change
    add_column :books, :bookfile, :string
  end
end
