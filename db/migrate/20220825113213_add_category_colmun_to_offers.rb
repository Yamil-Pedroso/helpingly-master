class AddCategoryColmunToOffers < ActiveRecord::Migration[7.0]
  def change
    add_column :offers, :category, :string
  end
end
