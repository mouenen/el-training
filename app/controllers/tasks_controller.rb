class TasksController < ApplicationController
  before_action :set_task, only: %i[show edit update destroy]

  def index
    @tasks = Task.all
  end

  def show
    @page_title = @task.title
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    if @task.save
      redirect_to tasks_path
    else
      render new_task_path
    end
  end

  private

  def task_params
    params.require(:task).permit(:title, :content, category_ids: [])
  end

  def set_task
    @task = Task.find(params[:id])
  end
end