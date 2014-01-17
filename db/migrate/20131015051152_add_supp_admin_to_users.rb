class AddSuppAdminToUsers < ActiveRecord::Migration
  def change
    add_column :users, :suppAdmin, :boolean
  end
end
