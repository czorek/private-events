class AddEventAndGuestsToAttendances < ActiveRecord::Migration
  def change
    add_column :attendances, :event_id, :integer
    add_column :attendances, :event_attendee_id, :integer
  end
end
