class AddDescriptionToPunchTimes < ActiveRecord::Migration
  def change
    add_column :punch_times, :description, :string
  end
end
