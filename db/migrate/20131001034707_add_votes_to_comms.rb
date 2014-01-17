class AddVotesToComms < ActiveRecord::Migration
  def change
    add_column :comms, :votes, :integer
  end
end
