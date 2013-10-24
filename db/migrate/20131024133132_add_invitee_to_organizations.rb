class AddInviteeToOrganizations < ActiveRecord::Migration
  def change
    add_column :organizations, :invitee, :integer
    add_column :organizations, :code, :string
  end
end
