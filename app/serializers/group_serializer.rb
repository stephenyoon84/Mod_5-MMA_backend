class GroupSerializer < ActiveModel::Serializer
  attributes :id, :name, :year
  has_many :allmembers
  has_one :leader

  def leader
    {leader_id: self.object.user.id,
     leader_name: self.object.user.name,
     leader_email: self.object.user.email,
     leader_gender: self.object.user.gender,
     leader_dob: self.object.user.dob}
  end

  def allmembers
    allMembers = []
    self.object.users.each{|u| allMembers.push(u)}
    self.object.members.each{|m| allMembers.push(m)}
    allMembers
  end
end
