class CreateCommVotes < ActiveRecord::Migration
  def change
    create_table :comm_votes do |t|
      t.integer :user_id
      t.integer :vote_id

      t.timestamps
    end
  end
end
