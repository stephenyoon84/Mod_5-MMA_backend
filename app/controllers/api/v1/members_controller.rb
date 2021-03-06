class Api::V1::MembersController < ApplicationController
  def index
    members = Member.all.order('active DESC, register_date DESC, id DESC')
    render json: members
  end

  def create
    new_member = Member.new(member_params)
    new_member.register_date = Date.today
    if member_params[:name] != "" && new_member.save
      json = {success: true}
    else
      json = {success: false}
    end
    render json: json
  end

  def update
    target = Member.find_by(id: params[:id])
    tGroup = Group.find_by(name: params[:member][:group])
    if member_params[:dob] == ""
      member_params[:dob] = target.dob
    end
    if target.update(member_params)
      if tGroup
        if !target.groups.empty?
          Group.find(target.groups.find_by(year: Date.today.year).id).members.delete(target)
        end
        tGroup.members << target
      end
      json = {success: true}
    else
      json = {success: false}
    end
    render json: json
  end

  private

  def member_params
    params.require(:member).permit(:id, :name, :email, :phone_number, :gender, :dob, :active, :info, :welcome_mail)
  end
end
