class CreateBooks < ActiveRecord::Migration[5.1]
  def change
    create_table :books do |t|
    		t.string "title"
    		t.text "description"
				t.integer "pages"
				t.text "text"
				t.integer "user_id"
				t.integer "category_id"
				t.attachment :picture
      t.timestamps
    end
  end
end
