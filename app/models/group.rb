class Group < ApplicationRecord
  belongs_to :user
  has_many :group_members
  has_many :users, through: :group_members, source: :member, source_type: 'User'
  has_many :members, through: :group_members, source: :member, source_type: 'Member'

  def all_members
    allMembers = []
    self.users.each{|u| allMembers.push(u)}
    self.members.each{|m| allMembers.push(m)}
    allMembers
  end
end
