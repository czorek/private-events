class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.datetime :time

      t.timestamps null: false
    end
  end
end
