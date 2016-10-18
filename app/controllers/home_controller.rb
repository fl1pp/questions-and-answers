class HomeController < ApplicationController
  skip_before_action :require_login
	def index
		@questions = Question.all
		@answers = Answer.all
		@corrections = Correction.all
	end
end