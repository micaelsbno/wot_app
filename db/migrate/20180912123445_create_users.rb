class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.float :latitude
      t.float :longitude
      t.integer :radius
      t.bigint :fb_id

      t.timestamps
    end
  end
end
