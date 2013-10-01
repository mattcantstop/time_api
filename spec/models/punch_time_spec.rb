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

  context "behavior based on #complete?" do
    context "when complete" do
      let(:punch_time) { PunchTime.new(:in => DateTime.now, :out => DateTime.new ) }
      specify { punch_time.complete?.should be_true }
    end

    context "when incomplete" do
      let(:punch_time) { PunchTime.new(:in => DateTime.now ) }
      specify { punch_time.complete?.should be_false }
    end

  end

end
