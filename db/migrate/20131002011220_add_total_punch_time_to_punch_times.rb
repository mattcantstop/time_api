class AddTotalPunchTimeToPunchTimes < ActiveRecord::Migration
  def change
    add_column :punch_times, :total_punch_time, :integer
  end
end
