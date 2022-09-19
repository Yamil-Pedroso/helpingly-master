class RemoveColumnFromOffer < ActiveRecord::Migration[7.0]
  def change
    remove_column :offers, :picture_url, :string
  end
end
