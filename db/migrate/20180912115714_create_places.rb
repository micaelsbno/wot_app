class CreatePlaces < ActiveRecord::Migration[5.2]
  def change
    create_table :places do |t|
      t.string :name
      t.string :city
      t.string :state
      t.string :street
      t.string :country
      t.integer :zip
      t.float :latitude
      t.float :longitude
      t.bigint :fb_id
      t.text :logo

      t.timestamps
    end
  end
end
