class ChangeEventsfbIdToBigInt < ActiveRecord::Migration[5.2]
  def change
    execute <<-SQL
      ALTER TABLE events
      ALTER COLUMN fb_id TYPE bigint USING fb_id::bigint
    SQL
  end
end