class CreateOffers < ActiveRecord::Migration[7.0]
  def change
    create_table :offers do |t|
      t.string :title
      t.string :description
      t.date :date
      t.decimal :hourly_rate
      t.string :location
      t.string :picture_url
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
