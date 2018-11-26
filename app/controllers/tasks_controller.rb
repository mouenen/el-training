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
      flash[:notice] = t('created', temp: @task.title)
      render :show
    else
      flash[:alert] = t('not_created', temp: @task.title)
      render :new
    end
  end

  def update
    if @task.update(task_params)
      flash[:notice] = t('updated', temp: @task.title)
      render :show
    else
      flash[:alert] = t('not_updated', temp: @task.title)
      render :edit
    end
  end

  def destroy
    if @task.destroy
      flash[:notice] = t('destroyed', temp: @task.title)
      redirect_to tasks_path
    else
      flash[:alert] = t('not_destroyed', temp: @task.title)
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
