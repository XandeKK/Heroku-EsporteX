class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :name, null: false, :limit => 50
      t.string :email, null: false, :limit => 100, unique: true
      t.text :image
      t.string :twitter
      t.string :instagram
      t.text :description
      t.string :password, null: false, :limit => 64

      t.timestamps
    end
  end
end
