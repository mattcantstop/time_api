class UsersOrganizations < ActiveRecord::Base

  has_and_belongs_to_many :users
  has_and_belongs_to_many :organizations

  def self.get_all_users_orgs(user)
    organizations = UsersOrganizations.where(user_id: user.id)
  end

end
