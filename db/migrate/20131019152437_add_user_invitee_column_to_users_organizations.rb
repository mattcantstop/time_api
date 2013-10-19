class AddUserInviteeColumnToUsersOrganizations < ActiveRecord::Migration
  def change
    add_column :users_organizations, :user_invitee, :integer
  end
end
