class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.string :name
      t.text :image_url
      t.integer :fb_id
      t.references :place, foreign_key: true
      t.text :description

      t.timestamps
    end
  end
end
