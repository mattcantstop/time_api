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

  def user_on_the_clock?
    if last_punch.out == nil
      return true
    else
      return false
    end
  end

  def last_punch
    punch_times.last
  end

end
