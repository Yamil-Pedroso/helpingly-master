class AddTimesToAppointments < ActiveRecord::Migration[7.0]
  def change
    add_column :appointments, :start_date, :date
    add_column :appointments, :end_date, :date
    add_column :appointments, :hours, :integer
  end
end
