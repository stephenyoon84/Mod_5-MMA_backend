class User < ApplicationRecord
  has_secure_password
  has_many :groups
  has_many :group_members, as: :member
  has_many :group_members, through: :groups
end
