class CreateAdminRooms < ActiveRecord::Migration[6.0]
  def change
    create_table :admin_rooms do |t|
      t.references :user, foreign_key: true
      t.references :admin, foreign_key: true
      t.timestamps
    end
  end
end
