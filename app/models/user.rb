class User < ActiveRecord::Base
  has_many :created_events,  :foreign_key => :creator_id, :class_name => "Event"
  has_many :attendances,     :foreign_key => :event_attendee_id
  has_many :attended_events, :through => :attendances, :source => :event

  def upcoming_events
    upcoming_events = self.attended_events.where("time > ?", Time.zone.now)
  end

  def previous_events
    previous_events = self.attended_events.where("time < ?", Time.zone.now)
  end
end
