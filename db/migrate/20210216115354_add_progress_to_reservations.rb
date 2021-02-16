class AddProgressToReservations < ActiveRecord::Migration[6.0]
  def change
    add_column :reservations, :progress, :integer
  end
end
