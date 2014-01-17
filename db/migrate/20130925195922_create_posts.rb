class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.text :description
      t.integer :votes
      t.references :category

      t.timestamps

    end
  end
end
