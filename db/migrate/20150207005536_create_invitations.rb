class CreateInvitations < ActiveRecord::Migration
  def change
    create_table :invitations do |t|
      t.references :guest, index: true
      t.references :event, index: true
      t.boolean :declined_invitation, default: false

      t.timestamps null: false
    end
    add_foreign_key :invitations, :guests
    add_foreign_key :invitations, :events
  end
end
