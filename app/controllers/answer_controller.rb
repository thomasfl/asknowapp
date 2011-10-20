class AnswerController < ApplicationController

	def show id
		
		answer = Answer.find(id)
		p answer.id
		p answer.question_id
		question = Question.find(answer.question_id)
		return answer
		# retur answer
	end

end
