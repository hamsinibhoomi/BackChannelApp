class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :unityid
      t.string :passwrod
      t.string :name

      t.timestamps
    end
  end
end
