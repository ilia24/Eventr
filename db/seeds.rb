# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


User.destroy_all
Eventrinfo.destroy_all
Hostinfo.destroy_all
Event.destroy_all
Group.destroy_all
Going.destroy_all
PersonalMessage.destroy_all
Request.destroy_all
Conversation.destroy_all
Review.destroy_all

#Create Eventr userbase
a = User.create(email: 'ilia@gmail.com', password: 'iliaisdnfioj')
Eventrinfo.create(first_name: 'Ilia', last_name: 'Demertchian',bio: "i like food", user: User.find(a))
#
# b = User.create(email: 'pritam@gmail.com', password: 'pritam')
# Eventrinfo.create(first_name: 'Pritam', last_name: 'Das',bio: "i like music and stuff", user: User.find(b))
#
# c = User.create(email: 'brian@gmail.com', password: 'brian')
# Eventrinfo.create(first_name: 'Brian', last_name: 'Du', bio: "My shoes are cool af", user: User.find(c))
#
# #create Hostr userbase
# d = User.create(email: 'rebelnightclub@gmail.com', password: 'club')
# Hostinfo.create(name: 'Rebel nightclub', address: '11 Polson St #1, Toronto', capacity: '4000', website: 'rebeltoronto.com', user: User.find(d))
# Eventrinfo.create(first_name: 'Pritam', last_name: 'Das',bio: "i like music and stuff", user: User.find(d))
#
# e = User.create(email: 'uniunnightclub@gmail.com', password: 'club')
# Hostinfo.create(name: 'Uniun Nightclub', address: '473 Adelaide St W, Toronto', capacity: '500', website: 'uniun.com', user: User.find(e))
# Eventrinfo.create(first_name: 'Pritam', last_name: 'Das',bio: "i like music and stuff", user: User.find(e))
#
# f = User.create(email: 'aircanadacenter@gmail.com', password: 'club')
# Hostinfo.create(name: 'Air Canada Center', address: '40 Bay St, Toronto', capacity: '8000', website: 'www.theaircanadacentre.com', user: User.find(f))
# Eventrinfo.create(first_name: 'Pritam', last_name: 'Das',bio: "i like music and stuff", user: User.find(f))
