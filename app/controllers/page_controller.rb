class PageController < ApplicationController
  layout 'home'

  def index
    @questions= Question.all 
  end
end
