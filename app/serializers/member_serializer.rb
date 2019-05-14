class MemberSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :phone_number, :gender, :dob
end
