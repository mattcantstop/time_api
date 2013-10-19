class Organization < ActiveRecord::Base

  belongs_to :user
  has_many :users_organizations
  has_many :users, :through :users_organization

end
