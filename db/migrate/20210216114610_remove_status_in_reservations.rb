class RemoveStatusInReservations < ActiveRecord::Migration[6.0]
  def change
    remove_column :reservations, :status
  end
end
