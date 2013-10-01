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

end
