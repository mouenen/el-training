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
      flash[:notice] = 'Task was successfully created.'
      redirect_to tasks_path
    else
      flash[:alert] = 'Task was unsuccessfully created.'
      render new_task_path
    end
  end

  def update
    if @task.update(task_params)
      flash[:notice] = 'Task was successfully updated.'
      redirect_to task_path
    else
      flash[:alert] = 'Task was unsuccessfully updated.'
      render edit_task_path
    end
  end

  def destroy
    if @task.destroy
      flash[:notice] = 'Task was successfully deleted.'
      redirect_to tasks_path
    else
      flash[:alert] = 'Task was unsuccessfully deleted.'
    end
  end

  private

  def task_params
    params.require(:task).permit(:title, :content, :sequence, category_ids: [])
  end

  def set_task
    @task = Task.find(params[:id])
  end
end
