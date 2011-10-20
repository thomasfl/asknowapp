class AnswerController < ApplicationController

	def show id
		
		answer = Answer.find(id)
		question = Question.find(answer.question_id)
		return answer
	end
end
