# This migration comes from ns_library (originally 20120925115216)
class CreateNsLibraryAuthors < ActiveRecord::Migration
  def change
    create_table :ns_library_authors do |t|
      t.string :name

      t.timestamps
    end
  end
end
