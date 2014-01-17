class AddPostIdToComms < ActiveRecord::Migration
  def change
    add_column :comms, :post_id, :integer
  end
end
