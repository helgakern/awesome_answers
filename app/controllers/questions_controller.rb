# run `rails g controller questions` to generate a questions controller

class QuestionsController < ApplicationController

  # show all of our questions
  def index
    @questions = Question.all
  end

  def new
    @question = Question.new # we need an instance of our resource to be used with `form_with`
  end

  def create
    # params.require(:question).permit(:title, :body) => tells rails to allow an object on the params that is called question. And on that question object allow the keys :title and :body
    @question = Question.new(params.require(:question).permit(:title, :body))
    #tell active record to goahead and run the INSERT SQL query against our db. Returns true if it saves, returns false if it doesn't save
    if @question.save
      redirect_to questions_path
    else
      redirect_to new_question_path
    end
  end
end
