class PageController < ApplicationController
  def index
    @questions= Question.all 
  end
end
