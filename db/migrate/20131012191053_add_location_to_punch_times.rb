class AddLocationToPunchTimes < ActiveRecord::Migration
  def change
    add_column :punch_times, :latitude, :decimal, {:precision=>10, :scale=>6}
    add_column :punch_times, :longitude, :decimal, {:precision=>10, :scale=>6}
  end
end
