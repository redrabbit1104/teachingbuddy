class SdateSchedule
  include ActiveModel::Model
  include ActiveModel::Attributes
  include ActiveRecord::AttributeAssignment
  attr_accessor :subject, :start_time, :end_time, :sdate

  def save
    sydate = Sdate.create(sdate: sdate)
    Schedule.create(subject: subject, start_time: start_time, end_time: end_time, sdate_id: sydate.id)
  end

end