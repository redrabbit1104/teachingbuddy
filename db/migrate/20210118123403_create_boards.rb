class CreateBoards < ActiveRecord::Migration[6.0]
  def change
    create_table :boards do |t|
      t.text :post
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
