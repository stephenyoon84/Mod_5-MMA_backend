class Api::V1::GroupsController < ApplicationController
  def index
    groups = Group.all.order(year: :desc)
    render json: groups
  end

  def create
    user = User.find_by(name: group_params[:user_name])
    group = Group.new(name: group_params[:name], year: Date.today.year, user: user)
    # byebug
    if group.save
      json = {message: "Group created", success: true}
    else
      json = {message: "Group creation fail", success: false}
    end
    render json: json
  end

  def update

  end

  def destroy

  end

  private

  def group_params
    params.require(:group).permit(:name, :year, :user_name)
  end
end
