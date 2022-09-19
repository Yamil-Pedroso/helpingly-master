class AddAcceptedToAppointment < ActiveRecord::Migration[7.0]
  def change
    add_column :appointments, :accepted, :boolean
  end
end
