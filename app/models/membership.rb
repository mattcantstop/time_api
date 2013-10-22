class Membership < ActiveRecord::Base

  belongs_to :user
  belongs_to :organization

  def org_name
    id = self.id
    org = Organization.find(id)
    return org.name
  end

end
