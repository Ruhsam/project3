class CreateWorkHours < ActiveRecord::Migration
  def change
    create_table :work_hours do |t|
      t.string :week_day
      t.string :hour

      t.timestamps null: false
    end
  end
end
