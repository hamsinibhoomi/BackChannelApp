class AddUserIdToComms < ActiveRecord::Migration
  def change
    add_column :comms, :user_id, :integer
  end
end
