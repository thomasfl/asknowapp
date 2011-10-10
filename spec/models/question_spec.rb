require 'spec_helper'

describe Question do
  it "can be instantiated" do
    Question.new.should be_an_instance_of(Question)
  end

  it "cannot save empty question" do
    Question.new.should_not be_valid
  end
end