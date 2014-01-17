class AddAdminToUser < ActiveRecord::Migration
  def self.up
    add_column :users, :admin, :boolean
  end

end
