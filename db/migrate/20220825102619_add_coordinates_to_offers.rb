class AddCoordinatesToOffers < ActiveRecord::Migration[7.0]
  def change
    add_column :offers, :latitude, :float
    add_column :offers, :longitude, :float
    add_column :offers, :address, :string
  end
end
