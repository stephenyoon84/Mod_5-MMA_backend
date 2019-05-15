class Api::V1::MembersController < ApplicationController
  def index
    members = Member.all
    render json: members
  end

  def create

  end

  def update

  end

  def destroy

  end

  private

  def member_params
    params.require(:member).permit(:name, :email, :phone_number, :gender, :dob, :register_date, :active, :info, :welcome_mail)
  end
end
