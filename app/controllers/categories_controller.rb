class CategoriesController < ApplicationController
  before_action :set_category, only: %i[show edit update destroy]

  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:notice] = t('created', temp: @category.name)
      render :show
    else
      flash[:alert] = t('not_created', temp: @category.name)
      render :new
    end
  end

  def update
    if @category.update(category_params)
      flash[:notice] = t('updated', temp: @category.name)
      render :show
    else
      flash[:alert] = t('not_updated', temp: @category.name)
      render :edit
    end
  end

  def destroy
    if @category.destroy
      flash[:notice] = t('destroyed', temp: @category.name)
      redirect_to categories_path
    else
      flash[:alert] = t('not_destroyed', temp: @category.name)
    end
  end

  private

  def category_params
    params.require(:category).permit(:name, :desc)
  end

  def set_category
    @category = Category.find(params[:id])
  end
end
