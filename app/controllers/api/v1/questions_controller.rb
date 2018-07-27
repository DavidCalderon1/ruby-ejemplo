class Api::V1::QuestionsController < Api::V1::BaseController
  def index
    @questions = Question.all
  end
end
