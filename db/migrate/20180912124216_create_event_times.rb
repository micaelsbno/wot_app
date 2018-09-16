class CreateEventTimes < ActiveRecord::Migration[5.2]
  def change
    create_table :event_times do |t|
      t.references :event, foreign_key: true
      t.timestamp :start_time
      t.timestamp :end_time

      t.timestamps
    end
  end
end
