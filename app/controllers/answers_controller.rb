class AnswersController < ApplicationController
  before_action :authenticate_user!, only: [:create]

  def create
    question = Question.find(params[:question_id])
    answer = question.answers.new(answer_params)
    answer.user_id = current_user.id

    answer.save
    redirect_to question
  end
  
  private
    def answer_params
      params.require(:answer).permit(:text)
    end
end

