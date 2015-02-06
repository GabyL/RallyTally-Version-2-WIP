class CreateVenues < ActiveRecord::Migration
  def change
    create_table :venues do |t|
      t.references :event, index: true
      t.string :name

      t.timestamps null: false
    end
    add_foreign_key :venues, :events
  end
end
