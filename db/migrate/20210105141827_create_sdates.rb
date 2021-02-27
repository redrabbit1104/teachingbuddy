class CreateSdates < ActiveRecord::Migration[6.0]
  def change
    create_table :sdates do |t|
      t.date :sdate 
      t.timestamps
    end
  end
end
