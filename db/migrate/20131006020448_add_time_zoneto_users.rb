class AddTimeZonetoUsers < ActiveRecord::Migration
  def change
    add_column :users, :time_zone_pref, :string
  end
end
