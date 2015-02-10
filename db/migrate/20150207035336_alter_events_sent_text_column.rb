class AlterEventsSentTextColumn < ActiveRecord::Migration
  def change
    change_column :events, :text_sent, :boolean, default: false
  end
end
