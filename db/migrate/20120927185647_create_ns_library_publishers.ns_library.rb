# This migration comes from ns_library (originally 20120927165825)
class CreateNsLibraryPublishers < ActiveRecord::Migration
  def change
    create_table :ns_library_publishers do |t|
      t.string :name

      t.timestamps
    end
  end
end
