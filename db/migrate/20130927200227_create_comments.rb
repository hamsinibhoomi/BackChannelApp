class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :description
      t.integer :c_vote
      t.references :post

      t.timestamps
    end
  end
end
