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

  def on_the_clock?
    if self.punch_times.last.in != nil
      return true
    elsif self.punch_times.last.out != nil
      return false
    else 
      return self.inspect
    end 
  end


end
