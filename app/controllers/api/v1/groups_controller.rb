class Api::V1::GroupsController < ApplicationController
  def index
    groups = Group.all.order(year: :desc)
    render json: groups
  end

  def create

  end

  def update

  end

  def destroy

  end

  private

  def group_params
    params.require(:group).permit(:name, :year)
  end
end
