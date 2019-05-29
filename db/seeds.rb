# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
Group.destroy_all
Member.destroy_all
GroupMember.destroy_all

admin = User.create!(name: "admin", email: "aa@aa.com", phone_number: 1111111111, gender: "M", dob: Date.new(1984, 3, 31), register_date: Date.new(2014, 2, 20), active: true, info: "admin", user_type: "admin", password: "aa")

u1 = User.create!(name: "bb", email: "bb@bb.com", phone_number: 1231231234, gender: "F", dob: Date.new(1988, 5, 2), register_date: Date.new(2017, 7, 25), active: true, info: "team leader", user_type: "team_leader", password: "bb")
u2 = User.create!(name: "cc", email: "cc@cc.com", phone_number: 2342342345, gender: "F", dob: Date.new(1990, 4, 8), register_date: Date.new(2015, 5, 30), active: true, info: "group leader", user_type: "group_leader", password: "cc")
u3 = User.create!(name: "dd", email: "dd@dd.com", phone_number: 3453453456, gender: "F", dob: Date.new(1992, 8, 16), register_date: Date.new(2016, 7, 2), active: true, info: "team", password: "dd")
u4 = User.create!(name: "ee", email: "ee@ee.com", phone_number: 4564564567, gender: "M", dob: Date.new(1975, 12, 25), register_date: Date.new(2008, 3, 31), active: true, info: "group leader", user_type: "group_leader", password: "ee")

g1 = Group.create!(name: "AAA", year: 2018, user: u2, info: "2018 new group")
g2 = Group.create!(name: "BBB", year: 2018, user: u4, info: "2018 new group")
g3 = Group.create!(name: "CCC", year: 2019, user: u2, info: "2019 new group")
g4 = Group.create!(name: "DDD", year: 2019, user: u4, info: "2019 new group")

m1 = Member.create!(name: "m1", email: "m1@mm.com", phone_number: 5675675678, gender: "F", dob: Date.new(1984, 1, 4), register_date: Date.new(2009, 11, 8), active: true, info: "")
m2 = Member.create!(name: "m2", email: "m2@mm.com", phone_number: 6786786789, gender: "M", dob: Date.new(1988, 10, 14), register_date: Date.new(2019, 1, 8), active: true, info: "")
m3 = Member.create!(name: "m3", email: "m3@mm.com", phone_number: 7897897890, gender: "F", dob: Date.new(1987, 4, 26), register_date: Date.new(2015, 5, 28), active: true, info: "")
m4 = Member.create!(name: "m4", email: "m4@mm.com", phone_number: 3213214321, gender: "M", dob: Date.new(1993, 6, 6), register_date: Date.new(2017, 3, 26), active: true, info: "")
m5 = Member.create!(name: "m5", email: "m5@mm.com", phone_number: 4324325432, gender: "M", dob: Date.new(1996, 9, 24), register_date: Date.new(2017, 3, 26), active: true, info: "")
m6 = Member.create!(name: "m6", email: "m6@mm.com", phone_number: 5435436543, gender: "F", dob: Date.new(1980, 11, 5), register_date: Date.new(2012, 8, 18), active: true, info: "")
m7 = Member.create!(name: "m7", email: "m7@mm.com", phone_number: 6546547654, gender: "F", dob: Date.new(1979, 12, 24), register_date: Date.new(2015, 8, 28), active: true, info: "")
m8 = Member.create!(name: "m8", email: "m8@mm.com", phone_number: 7657658765, gender: "M", dob: Date.new(1999, 1, 1), register_date: Date.new(2019, 3, 19), active: true, info: "")
m9 = Member.create!(name: "m9", email: "m9@mm.com", phone_number: 8768769876, gender: "F", dob: Date.new(1984, 8, 15), register_date: Date.new(2000, 11, 1), active: true, info: "")
m10 = Member.create!(name: "m10", email: "m10@mm.com", phone_number: 9879870987, gender: "F", dob: Date.new(1986, 5, 25), register_date: Date.new(2013, 7, 22), active: true, info: "")

g1.users << u1
g1.users << u3
g1.members << m1
g1.members << m2
g1.members << m3
g1.members << m4
g1.members << m5
g2.members << m6
g2.members << m7
g2.members << m8
g2.members << m9
g2.members << m10

g3.users << u3
g4.users << u1
g3.members << m2
g3.members << m4
g3.members << m6
g3.members << m8
g3.members << m10
g4.members << m1
g4.members << m3
g4.members << m5
g4.members << m7
g4.members << m9
