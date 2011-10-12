require 'spec_helper'

describe AnswerController do

	before(:each) do
      @controller = AnswerController.new
      @answerId = 123
      @answer = mock(Answer).
  	  Answer.stub(:find).with(@answerId).return(@answer)
    end

	it "should show a answer page id" do
		res = @controller.show(2)
		res.should_not == nil
	end

	it "should show fetch the related question" do
		res = @controller.show(2)
	end
end
