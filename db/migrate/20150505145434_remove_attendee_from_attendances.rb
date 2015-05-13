class RemoveAttendeeFromAttendances < ActiveRecord::Migration
  def change
    remove_column :attendances, :attendee_id, :integer
  end
end
