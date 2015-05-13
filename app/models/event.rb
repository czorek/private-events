class Event < ActiveRecord::Base
  belongs_to :creator,     :class_name  => "User"
  has_many   :attendances, :foreign_key => :event_id
  has_many   :attendees,   :through     => :attendances, :source => :event_attendee

  scope :past,     -> { where("time < ?", Time.zone.now) }
  scope :upcoming, -> { where("time > ?", Time.zone.now) }
end

