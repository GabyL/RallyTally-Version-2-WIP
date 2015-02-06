class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :title
      t.string :time
      t.boolean :text_sent
      t.string :stylized_time

      t.timestamps null: false
    end
  end
end
