class RoomAdminUser
  include ActiveModel::Model
  include ActiveModel::Attributes
  include ActiveRecord::AttributeAssignment
  attr_accessor :target_id, :room_id, :user_id, :admin_id

  def save
    adminroom = AdminRoom.create(target_id: target_id)
    RoomAdmin.create(room_id: adminroom.id , user_id: user_id, admin_id: admin_id)
  end

end