class Member < ApplicationRecord
  has_many :group_members, as: :member
  has_many :groups, through: :group_members
end
