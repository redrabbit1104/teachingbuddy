class CreateSchedules < ActiveRecord::Migration[6.0]
  def change
    create_table :schedules do |t|
      t.string :subject
      t.time :start_time
      t.time :end_time
      t.references :sdate, foreign_key: true
      t.timestamps
    end
  end
end
