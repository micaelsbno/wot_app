class CreateUserEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :user_events do |t|
      t.references :event, foreign_key: true
      t.references :user, foreign_key: true
      t.string :rsvp

      t.timestamps
    end
  end
end
