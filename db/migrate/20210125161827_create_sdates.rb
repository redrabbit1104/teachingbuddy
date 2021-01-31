class CreateSdates < ActiveRecord::Migration[6.0]
  def change
    create_table :sdates do |t|
      t.date :sdate 
      t.integer :syear
      t.integer :smonth
      t.integer :sday
      t.timestamps
    end
  end
end
