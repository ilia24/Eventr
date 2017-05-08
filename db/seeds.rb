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

#Create Eventr userbase
a = User.create(email: 'ilia@gmail.com', password: 'ilia')
Eventrinfo.create(first_name: 'Ilia', last_name: 'Demertchian',bio: "i like food", user: User.find(a))

b = User.create(email: 'pritam@gmail.com', password: 'pritam')
Eventrinfo.create(first_name: 'Pritam', last_name: 'Das',bio: "i like music and stuff", user: User.find(b))

c = User.create(email: 'brian@gmail.com', password: 'brian')
Eventrinfo.create(first_name: 'Brian', last_name: 'Du', bio: "My shoes are cool af", user: User.find(c))

#create Hostr userbase
d = User.create(email: 'rebelnightclub@gmail.com', password: 'club')
Hostinfo.create(name: 'Rebel nightclub', address: '11 Polson St #1, Toronto', capacity: '4000', website: 'rebeltoronto.com', user: User.find(d))

e = User.create(email: 'uniunnightclub@gmail.com', password: 'club')
Hostinfo.create(name: 'Uniun Nightclub', address: '473 Adelaide St W, Toronto', capacity: '500', website: 'uniun.com', user: User.find(e))

f = User.create(email: 'aircanadacenter@gmail.com', password: 'club')
Hostinfo.create(name: 'Air Canada Center', address: '40 Bay St, Toronto', capacity: '8000', website: 'www.theaircanadacentre.com', user: User.find(f))

#create events

Event.create(user: User.find(d), picurl: 'http://rebeltoronto.com/wp-content/uploads/2017/05/carlc-rz.jpg', location: '11 Polson St #1, Toronto', price: 25, name: 'Carl Cox live at Rebel', description: "House legend Carl Cox launched his career during the late '80s rave explosion, and he's still headlining massive EDM festivals decades later", date: Time.now, time: Time.now )
Event.create(user: User.find(e), picurl: 'http://www.ibiza-sunny.com/wp-content/uploads/2017/04/17498548_1499463813421891_3279911362657112823_n.jpg', location: '473 Adelaide St W, Toronto', price: 15, name: 'Mark Knight: ALL KNIGHT LONG', description: "The All Knight Long tour sets out to capture this very unique magic, putting one of the world's foremost DJs front and centre for the entire night", date: Time.now, time: Time.now )
Event.create(user: User.find(f), picurl: 'http://www.etonline.com/news/2016/09/24271863/1280_theweeknd_album_twitter.jpg', location: '40 Bay St, Toronto', price: 250, name: 'The Weeknd Starboy tour', description: "Starboy is The Weeknd’s highly anticipated third studio album (excluding the mixtape compilation album Trilogy). The “king of the fall” announced the album after teasing his fans on his instagram.", date: Time.now, time: Time.now )
Event.create(user: User.find(f), picurl: 'http://www.edsheeran.com/sites/g/files/g2000006291/f/201703/Ed-news-post.jpg', location: '40 Bay St, Toronto', price: 250, name: 'Ed Sheeran World tour', description: "Ed will be coming back to North America to play 48 dates starting this Summer. Tickets on general sale Friday 17th March.", date: Time.now, time: Time.now )
Event.create(user: User.find(f), picurl: 'https://bridge909.org/files/uploads/2017/04/Gorillaz_SprintCenter-17x11.jpg', location: '40 Bay St, Toronto', price: 250, name: 'Gorillaz live tour', description: "Dubbed “the world’s most successful virtual act,” the group has enjoyed a culturally significant, critically admired and commercially successful career since its first release in 2001", date: Time.now, time: Time.now )
Event.create(user: User.find(d), picurl: 'http://rebeltoronto.com/wp-content/uploads/2017/05/carlc-rz.jpg', location: '11 Polson St #1, Toronto', price: 25, name: 'Carl Cox live at Rebel', description: "House legend Carl Cox launched his career during the late '80s rave explosion, and he's still headlining massive EDM festivals decades later", date: Time.now, time: Time.now )
Event.create(user: User.find(f), picurl: 'http://www.etonline.com/news/2016/09/24271863/1280_theweeknd_album_twitter.jpg', location: '40 Bay St, Toronto', price: 250, name: 'The Weeknd Starboy tour', description: "Starboy is The Weeknd’s highly anticipated third studio album (excluding the mixtape compilation album Trilogy). The “king of the fall” announced the album after teasing his fans on his instagram.", date: Time.now, time: Time.now )
Event.create(user: User.find(e), picurl: 'http://www.ibiza-sunny.com/wp-content/uploads/2017/04/17498548_1499463813421891_3279911362657112823_n.jpg', location: '473 Adelaide St W, Toronto', price: 15, name: 'Mark Knight: ALL KNIGHT LONG', description: "The All Knight Long tour sets out to capture this very unique magic, putting one of the world's foremost DJs front and centre for the entire night", date: Time.now, time: Time.now )
Event.create(user: User.find(d), picurl: 'http://host3.torontonightclub.com/site/wp-content/uploads/2017/04/EM_Artwork-750x400.jpg', location: '11 Polson St #1, Toronto', price: 25, name: 'Erick Morillo NOIR at Rebel', description: "House legend Erick Morillo launched his career during the late '80s rave explosion, and he's still headlining massive EDM festivals decades later", date: Time.now, time: Time.now )
Event.create(user: User.find(f), picurl: 'https://bridge909.org/files/uploads/2017/04/Gorillaz_SprintCenter-17x11.jpg', location: '40 Bay St, Toronto', price: 250, name: 'Gorillaz live tour', description: "Dubbed “the world’s most successful virtual act,” the group has enjoyed a culturally significant, critically admired and commercially successful career since its first release in 2001", date: Time.now, time: Time.now )
Event.create(user: User.find(d), picurl: 'http://host3.torontonightclub.com/site/wp-content/uploads/2017/04/EM_Artwork-750x400.jpg', location: '11 Polson St #1, Toronto', price: 25, name: 'Erick Morillo NOIR at Rebel', description: "House legend Erick Morillo launched his career during the late '80s rave explosion, and he's still headlining massive EDM festivals decades later", date: Time.now, time: Time.now )
Event.create(user: User.find(f), picurl: 'http://www.edsheeran.com/sites/g/files/g2000006291/f/201703/Ed-news-post.jpg', location: '40 Bay St, Toronto', price: 250, name: 'Ed Sheeran World tour', description: "Ed will be coming back to North America to play 48 dates starting this Summer. Tickets on general sale Friday 17th March.", date: Time.now, time: Time.now )
