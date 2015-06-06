class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.string :channel_id
      t.string :channel_name
      t.string :timestamp
      t.text :text
      t.string :team_id
      t.string :user_name
      t.string :user_id
      t.string :token

      t.timestamps null: false
    end
  end
end
