class CreateComms < ActiveRecord::Migration
  def change
    create_table :comms do |t|
      t.string :content
      t.references :posts
      t.timestamps
    end
  end
end
