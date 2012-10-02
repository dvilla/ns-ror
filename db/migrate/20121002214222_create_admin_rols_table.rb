class CreateAdminRolsTable < ActiveRecord::Migration
  def up
    create_table :admin_rols do |t|
      t.references :rol, :user
    end
  end

  def down
    drop_table :admin_rols
  end
end
