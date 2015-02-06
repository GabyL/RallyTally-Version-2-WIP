class CreateEventsGuestsJoin < ActiveRecord::Migration
  def change
    create_table :events_guests_joins do |t|
      t.integer :event_id
      t.integer :guest_id
      t.boolean :declined_invitation, default: false
    end
  end
end
