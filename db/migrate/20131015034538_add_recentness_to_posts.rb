class AddRecentnessToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :recentness, :float
  end
end
