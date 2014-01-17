class FixColumnName < ActiveRecord::Migration
  def change
    rename_column :comm_votes, :vote_id, :comm_id
  end

end
