class AddAddedByToGame < ActiveRecord::Migration[5.1]
  def change
    add_column :games, :added_by, :integer
    add_column :games, :confirmed, :boolean, default: :false
  end
end
