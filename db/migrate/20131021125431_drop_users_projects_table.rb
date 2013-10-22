class DropUsersProjectsTable < ActiveRecord::Migration
  def up
    drop_table :users_projects
  end
end
