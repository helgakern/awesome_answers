# run `rails g controller questions` to generate a questions controller

class QuestionsController < ApplicationController

  # show all of our questions
  def index
    @questions = Question.all.order('updated_at DESC')
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
      render :new
    end
  end

  def show
    id = params[:id]
    @question = Question.find(id)
  end

  def destroy
    id = params[:id]
    @question = Question.find(id)
    @question.destroy
    redirect_to questions_path
  end

  def edit
    id = params[:id]
    @question = Question.find(id)
  end

  def update
    id = params[:id]
    @question = Question.find(id)
    if @question.update(params.require(:question).permit(:title, :body))
      redirect_to question_path(@question)
    else
      render :edit
    end
  end
end
