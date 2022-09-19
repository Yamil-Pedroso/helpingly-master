class SetDefaultAccepted < ActiveRecord::Migration[7.0]
  def change
    change_column :appointments, :accepted, :boolean, default: false
  end
end
