class AtPhotoColumnToOffer < ActiveRecord::Migration[7.0]
  def change
    add_column :offers, :photo, :string
  end
end
