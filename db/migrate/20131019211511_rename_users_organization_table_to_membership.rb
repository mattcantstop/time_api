class RenameUsersOrganizationTableToMembership < ActiveRecord::Migration
  def change
    rename_table :users_organizations, :memberships
  end
end
