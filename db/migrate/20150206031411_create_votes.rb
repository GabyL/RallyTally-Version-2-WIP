class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.references :event, index: true
      t.references :guest, index: true
      t.references :venue, index: true

      t.timestamps null: false
    end
    add_foreign_key :votes, :events
    add_foreign_key :votes, :guests
    add_foreign_key :votes, :venues
  end
end
