class TasksController < ApplicationController
  before_action :set_task, only: %i[show edit update destroy]

  def index
    @tasks = Task.all
  end

  def show
    @page_title = @task.title
  end

  private

  def set_task
    @task = Task.find(params[:id])
  end
end