class CreateAlchemies < ActiveRecord::Migration
  def change
    create_table :alchemies do |t|
    t.string :channel
    t.string :score
    t.string :type

      t.timestamps null: false
    end
  end
end
