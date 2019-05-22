class Api::V1::MembersController < ApplicationController
  def index
    # members = Group.all.collect{|g| g.all_members}
    # leaders = Group.all.collect{|g| g.user}
    # members << leaders
    # members.flatten!.uniq!.sort_by!{|m| m.register_date}.reverse!
    # users = User.where.not(user_type: 'admin')
    members = Member.all.order(register_date: :desc)
    # m = []
    # users.each{|u| m.push(u)}
    # members.each{|me| m.push(me)}
    # m.sort_by!{|m| m.register_date}.reverse!
    # byebug
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
    target = Member.find_by(id: params[:id])
    tGroup = Group.find_by(name: params[:member][:group])
    if target.update(member_params)
      # byebug
      tGroup.members << target if !target.groups.include?(tGroup)
      json = {success: true}
    else
      json = {success: false}
    end
    render json: json
  end

  def destroy

  end

  private

  def member_params
    params.require(:member).permit(:id, :name, :email, :phone_number, :gender, :dob, :active, :info, :welcome_mail)
    # params.require(:member).permit(:name, :email, :phone_number, :gender, :dob, :register_date, :active, :info, :welcome_mail)
  end
end
