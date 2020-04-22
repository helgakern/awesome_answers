# run `rails g controller questions` to generate a questions controller

class QuestionsController < ApplicationController

  # show all of our questions
  def index
    @questions = Question.all
  end
end
