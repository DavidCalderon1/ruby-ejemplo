class QuestionsController < ApplicationController
  def new
    @question = Question.new
  end

  def show
    @question = Question.find(params[:id])
  end

  def create
    user = current_user
    @question = user.questions.new(question_params)

    if @question.save
      redirect_to @question
    else
      render :new
    end
  end

  private
    def question_params
      params.require(:question).permit(:title)
    end
end
