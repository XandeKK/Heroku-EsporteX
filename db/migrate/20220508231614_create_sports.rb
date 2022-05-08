class CreateSports < ActiveRecord::Migration[7.0]
  def change
    create_table :sports do |t|
      t.string :sport, null: false, :limit => 45
      t.text :image

      t.timestamps
    end
  end
end
