class TasksController < ApplicationController
  def list
    @tasks = Task.all
  end

  def show
    @task = Task.find(params[:id])
  end

  def new
    @task = Task.new
  end

  def create
    @task = Restaurant.new(params[:task])
    @task.save # Will raise ActiveModel::ForbiddenAttributesError
    redirect_to task_path(@task)
  end
end

private

def restaurant_params
  params.require(:task).permit(:title, :details)
end
