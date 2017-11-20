class CreatePlayers < ActiveRecord::Migration[5.1]
  def change
    create_table :players do |t|
      t.integer :player_id
      t.float :elo

      t.timestamps
    end
  end
end
