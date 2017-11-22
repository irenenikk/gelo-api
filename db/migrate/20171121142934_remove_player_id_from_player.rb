class RemovePlayerIdFromPlayer < ActiveRecord::Migration[5.1]
  def change
    remove_column :players, :player_id, :integer
  end
end
