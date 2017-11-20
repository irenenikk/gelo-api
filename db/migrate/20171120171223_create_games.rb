class CreateGames < ActiveRecord::Migration[5.1]
  def change
    create_table :games do |t|
      t.integer :result
      t.integer :white
      t.integer :black

      t.timestamps
    end
  end
end
