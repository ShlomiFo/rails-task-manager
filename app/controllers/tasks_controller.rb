class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]
  def list
    @tasks = Task.all
  end

  def show

  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(params[:task])
    @task.save # Will raise ActiveModel::ForbiddenAttributesError
    redirect_to task_path(@task)
  end

  def edit

  end

  def update

    @task.update(task_params)
    # No need for app/views/restaurants/update.html.erb
    redirect_to task_path(@task)
  end

  def destroy

    @tasks.destroy
    # No need for app/views/restaurants/destroy.html.erb
    redirect_to tasks_path, status: :see_other
  end

  def set_task
    @task = Task.find(params[:id])
  end

  private

  def tasks_params
    params.require(:task).permit(:title, :details)
  end
end
