class MemberSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :phone_number, :gender, :dob, :register_date, :active, :info, :welcome_mail
end
