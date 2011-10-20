require 'spec_helper'

describe AnswerController do

	before(:each) do
      @controller = AnswerController.new
      @answerId = 123
      @questionId = 456
      @answer = mock_model(Answer,:id=>@answerId, :question_id=>@questionId)
      question_model = mock_model(Question, :id=>@questionId)
  	  Answer.stub(:find).with(@answerId).and_return(@answer)
  	  Question.stub(:find).with(@questionId).and_return(@question)

    end

	it "should show an answer page id" do
		res = @controller.show(123)
		res.should_not == nil
	end

	it "should fetch the answer requested" do
		Answer.should_receive(:find)
		res = @controller.show(123)
	end

	it "should fetch the related question" do
		question_model = mock_model(Question)
		Question.should_receive(:find).with(@questionId).and_return(question_model)
		res = @controller.show(123)
	end
end
