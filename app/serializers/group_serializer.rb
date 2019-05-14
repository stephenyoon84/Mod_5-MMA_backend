class GroupSerializer < ActiveModel::Serializer
  attributes :id, :name, :year
  has_many :members
  has_many :users
  has_one :user
end
