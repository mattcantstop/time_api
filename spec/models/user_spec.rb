require 'spec_helper'

# STRONGLY NEED TO DRY THIS UP!
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

  describe "#all_punches_complete?" do
    context "when all punches have both in and out" do
      punch1 = PunchTime.new(:in => DateTime.now, :out => DateTime.now)
      punch2 = PunchTime.new(:in => DateTime.now, :out => DateTime.now)
      let(:user) { User.new(email: "matthewlduff@gmail.com", punch_times: [punch1, punch2]) }
      specify { user.all_punches_complete?.should be_true }
    end

    context "when a punch has in but not out" do
      punch1 = PunchTime.new(:in => DateTime.now)
      let(:user) { User.new(email: "matthewlduff@gmail.com", punch_times: [punch1]) }
      specify { user.all_punches_complete?.should be_false }
    end

  end

end
