class HomeController < ApplicationController
	def index
		@questions = Question.all
		@answers = Answer.all
		@corrections = Correction.all
	end
end