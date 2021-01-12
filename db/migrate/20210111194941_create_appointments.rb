class CreateAppointments < ActiveRecord::Migration[6.0]
  def change
    create_table :appointments do |t|
      t.datetime :appointment_time
      t.boolean :vaccination_records, default: false
      t.string :haircut_type
      t.integer :pet_id
      t.integer :groomer_id

      t.timestamps
    end
  end
end
