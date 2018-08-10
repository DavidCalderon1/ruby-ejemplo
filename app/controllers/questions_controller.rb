class QuestionsController < ApplicationController
  before_action :authenticate_user!, only: [:create]
  
  def new
    @question = Question.new
  end

  def show
    @question = Question.find(params[:id])
    @answer = Answer.new
    @meta_title = @question.title
    @meta_description = @question.description.truncate(250) unless @question.description.nil?
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
      params.require(:question).permit(:title, :description, :tag_list)
    end
end
