class AddPopularityToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :popularity, :integer
  end
end
