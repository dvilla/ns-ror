# This migration comes from ns_library (originally 20120925192935)
class CreateNsLibraryAuthorBooks < ActiveRecord::Migration
  def change
    create_table :author_books do |t|
	  t.references :author, null: false
	  t.references :book, null: false
      t.timestamps
    end
  end
end
