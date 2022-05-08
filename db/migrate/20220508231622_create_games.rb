class CreateGames < ActiveRecord::Migration[7.0]
  def change
    create_table :games do |t|
      t.references :user, null: false, foreign_key: true
      t.references :sport, null: false, foreign_key: true
      t.references :city, null: false, foreign_key: true
      t.references :state, null: false, foreign_key: true
      t.time :start, null: false
      t.time :end, null: false
      t.date :date, null: false
      t.string :address, null: false, :limit => 100
      t.text :description, null: false, :limit => 300

      t.timestamps
    end
  end
end
