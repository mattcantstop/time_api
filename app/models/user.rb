class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :punch_times
  has_many :projects
  has_many :user_projects
  has_many :organizations
  has_many :user_organizations

  def all_punches_complete?
    self.punch_times.any? { |punch_time| punch_time.out.blank? }
  end

  def last_punch
    punch_times.last
  end

end
