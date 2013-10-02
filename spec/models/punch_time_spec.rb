require 'spec_helper'

describe PunchTime do 
  context "validations" do

    context "not valid" do
      specify { subject.should_not be_valid }
    end

    context "valid" do
      subject { described_class.new(:in => DateTime.now) }
      specify { subject.should be_valid }
    end

  end

  context "#complete?" do
    context "when complete" do
      let(:punch_time) { PunchTime.new(:in => DateTime.now, :out => DateTime.new ) }
      specify { punch_time.complete?.should be_true }
    end

    context "when incomplete" do
      let(:punch_time) { PunchTime.new(:in => DateTime.now ) }
      specify { punch_time.complete?.should be_false }
    end

  end

  context "#calculate_total_punch_time" do
    context "when :out is present" do
     let(:in_time) { Time.now }
     let(:out_time) { in_time + 5.minutes } 
     subject { described_class.create(:in => in_time, :out => out_time) }
     its(:total_punch_time) { should == 300 }
    end
  end

end
