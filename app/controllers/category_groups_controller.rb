# frozen_string_literal: true
class CategoryGroupsController < ApplicationController
  before_action :set_category_group, only: %i(show edit update destroy)

  # GET /category_groups
  def index
    @category_groups = policy_scope(CategoryGroup)
  end

  # GET /category_groups/1
  def show; end

  # GET /category_groups/new
  def new
    @category_group = CategoryGroup.new
  end

  # GET /category_groups/1/edit
  def edit; end

  # POST /category_groups
  def create
    @category_group = CategoryGroup.new(category_group_params.merge(user: current_user))

    if @category_group.save
      redirect_to @category_group, notice: 'Category group was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /category_groups/1
  def update
    if @category_group.update(category_group_params)
      redirect_to @category_group, notice: 'Category group was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /category_groups/1
  def destroy
    @category_group.destroy
    redirect_to category_groups_url, notice: 'Category group was successfully destroyed.'
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_category_group
    @category_group = CategoryGroup.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def category_group_params
    params.require(:category_group).permit(:name)
  end
end
