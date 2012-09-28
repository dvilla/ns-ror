# This migration comes from ns_library (originally 20120925115152)
class CreateNsLibraryBooks < ActiveRecord::Migration
  def change
    create_table :ns_library_books do |t|
      t.string :title
      t.integer :isbn
      t.text :description
	  t.references :publisher

      t.timestamps
    end
  end
end
