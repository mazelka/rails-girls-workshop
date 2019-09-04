class GoalsController < ApplicationController
  def index
  end

  def new
    @goal = Goal.new
  end

  def create
    @goal = Goal.new(goal_params)
    if @goal.save
      flash[:success] = 'Your goal has been successfully created'
      redirect_to goals_path
    else
      flash[:error] = 'Please fill in all necessary fields.'
      render 'new'
    end
  end

  def goal_params
    params.require(:goal).permit(:title, :description, :priority, :due_date, :complete)
  end
end
