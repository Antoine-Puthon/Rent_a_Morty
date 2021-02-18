class AddFavoriToReservations < ActiveRecord::Migration[6.0]
  def change
    add_column :reservations, :favori, :boolean
  end
end
