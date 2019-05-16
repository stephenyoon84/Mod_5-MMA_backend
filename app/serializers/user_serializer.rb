class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :phone_number, :gender, :dob, :active, :user_type, :groups
end
