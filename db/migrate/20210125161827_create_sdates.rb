class CreateSdates < ActiveRecord::Migration[6.0]
  def change
    create_table :sdates do |t|
      t.date :syear
      t.date :smonth
      t.date :sday
      t.timestamps
    end
  end
end
