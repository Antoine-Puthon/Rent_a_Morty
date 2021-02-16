class AddConfirmationToReservations < ActiveRecord::Migration[6.0]
  def change
    add_column :reservations, :confirmation, :boolean, default: false
  end
end
