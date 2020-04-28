# run `rails g controller questions` to generate a questions controller

class QuestionsController < ApplicationController
  #before_action is a controlle hook provided by rails
  # 1) it accepts a method name
  # 2) options hash
  before_action :authenticate_user!, except: [:index, :show] 
  # will call authenticate_user! before every method except :index and :show
  before_action :authorize!, only: [:edit, :update, :destroy]

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
    @question.user = current_user
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
    # For the form_with helper 
    @answer = Answer.new 
    # For the list of answer
    @answers = @question.answers.order(created_at: :desc)
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

  def authorize! 
    redirect_to root_path, alert: 'Not Authorized' unless can?(:crud, Question)
  end
end
