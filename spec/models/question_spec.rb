require 'spec_helper'

describe Question do
  it "can be instantiated" do
    Factory(:question).should be_an_instance_of(Question)
  end

  it "should require a description" do
  	Question.new.should validate_presence_of(:description)
  end

end