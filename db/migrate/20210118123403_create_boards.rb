class CreateBoards < ActiveRecord::Migration[6.0]
  def change
    create_table :boards do |t|
      t.text :post, null: false
      t.date :post_date, null: false
      t.references :user,     null: false, foreign_key: true
      t.references :admin,     null: false, foreign_key: true
      t.timestamps
    end
  end
end
