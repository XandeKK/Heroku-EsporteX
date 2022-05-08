class CreateStates < ActiveRecord::Migration[7.0]
  def change
    create_table :states do |t|
      t.string :state, null: false, :limit => 50, unique: true

      t.timestamps
    end
  end
end
