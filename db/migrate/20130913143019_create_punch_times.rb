class CreatePunchTimes < ActiveRecord::Migration
  def change
    create_table :punch_times do |t|
      t.datetime :in
      t.datetime :out
      t.integer :user_id
      t.integer :project_id
      t.integer :organization_id
      t.string :tag

      t.timestamps
    end
    add_index :punch_times, :user_id
    add_index :punch_times, :project_id
    add_index :punch_times, :organization_id
    add_index :punch_times, :tag
  end
end
