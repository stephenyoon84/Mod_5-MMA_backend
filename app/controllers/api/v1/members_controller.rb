class Api::V1::MembersController < ApplicationController
  def index
    members = Member.all.order(register_date: :desc)
    render json: members
  end

  def create
    new_member = Member.new(member_params)
    dobA = member_params[:dob].split('/')
    bdate = Date.new(dobA[2].to_i, dobA[0].to_i, dobA[1].to_i)
    new_member.dob = bdate
    new_member.register_date = Date.today
    if new_member.save
      json = {success: true}
    else
      json = {success: false}
    end
    render json: json
  end

  def update

  end

  def destroy

  end

  private

  def member_params
    params.require(:member).permit(:name, :email, :phone_number, :gender, :dob, :active, :info, :welcome_mail)
    # params.require(:member).permit(:name, :email, :phone_number, :gender, :dob, :register_date, :active, :info, :welcome_mail)
  end
end
