class CreateAdminRolesTable < ActiveRecord::Migration
  def up
    create_table :admin_roles do |t|
      t.references :role, :user
    end
  end

  def down
    drop_table :admin_roles
  end
end
