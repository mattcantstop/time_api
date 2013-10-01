require 'spec_helper'

describe User do
  it "should have an email" do
    user = User.new
    user.should_not be_valid
  end 

  it "should not be valid without an in time" do
    punch1 = PunchTime.new(:in => "#{Time.now}")
    punch2 = PunchTime.new(:in => "#{Time.now}")
    user = User.new(:punch_times => [punch1, punch2])
    user.punch_times.should include(punch1)
  end

end
