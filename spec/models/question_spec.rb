require 'spec_helper'

describe Question do
  it "can be instantiated" do
    Question.new.should be_an_instance_of(Question)
  end

  it "can be saved successfully" do
    Question.create.should be_persisted
  end
end