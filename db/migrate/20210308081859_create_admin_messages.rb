class CreateAdminMessages < ActiveRecord::Migration[6.0]
  def change
    create_table :admin_messages do |t|
      t.string  :content
      t.references :admin_room, foreign_key: true
      t.references :user, foreign_key: true
      t.references :admin, foreign_key: true
      t.timestamps
    end
  end
end
