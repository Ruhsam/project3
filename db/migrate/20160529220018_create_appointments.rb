class CreateAppointments < ActiveRecord::Migration
  def change
    create_table :appointments do |t|
      t.date :date
      t.integer :time
      t.string :reason_for_visit
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
