class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :punch_times
  has_many :user_projects
  has_many :projects, :through => :user_projects
  has_many :user_organizations
  has_many :organizations, :through => :user_organizations

  def all_punches_complete?
    self.punch_times.all? { |punch_time| punch_time.complete? }
  end

  def last_punch
    punch_times.last
  end

end
