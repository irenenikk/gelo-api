class AddGlickoItemsToPlayers < ActiveRecord::Migration[5.1]
  def change
    add_column :players, :deviation, :float
    add_column :players, :volatility, :float    
  end
end
