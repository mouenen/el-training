class TasksController < ApplicationController
  before_action :set_task, only: %i[show edit update destroy]

  def index
    @tasks = Task.all
  end

  def new
    @task = Task.new
  end

  def create
    @task = current_user.tasks.new(task_params)
    if @task.save
      flash[:notice] = 'Task was successfully created.'
      render :show
    else
      flash[:alert] = 'Task was unsuccessfully created.'
      render :new
    end
  end

  def update
    if @task.update(task_params)
      flash[:notice] = 'Task was successfully updated.'
      render :show
    else
      flash[:alert] = 'Task was unsuccessfully updated.'
      render :edit
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
    params.require(:task).permit(:title, :content, :sequence, :finished_at, category_ids: [])
  end

  def set_task
    @task = Task.find(params[:id])
  end
end
