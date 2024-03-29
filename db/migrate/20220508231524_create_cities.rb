class CreateCities < ActiveRecord::Migration[7.0]
  def change
    create_table :cities do |t|
      t.string :city, null: false, :limit => 50
      t.references :state, null: false, foreign_key: true

      t.timestamps
    end
  end
end
