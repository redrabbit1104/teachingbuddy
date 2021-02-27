class CreateConfirms < ActiveRecord::Migration[6.0]
  def change
    create_table :confirms do |t|
      t.boolean       :check
      t.references :user, foreign_key: true
      t.references :admin, foreign_key: true
      t.references :schedule, foreign_key: true
      t.timestamps
    end
  end
end
