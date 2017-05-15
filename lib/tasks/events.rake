require 'json'

task :get_events => :environment do
  # Connect to api

  # Issue API query
  response = HTTParty.get('http://api.eventful.com/json/events/search?...&app_key=qSvMLQqzs4QkKqTG&location=Toronto,%20Ontario,Canada&date=Future&sort_order=popularity&sort_direction=descending&page_size=25&image_sizes=blackborder500')

  #puts response.body, response.code, response.message, response.headers.inspect

  parsed_response = JSON.parse(response.body)

  # parsed_response['events'].each do |e|
  #   latitude =  e['latitude']
  #   puts latitude
  # end
placeholderuser = User.create(email: 'ilia@gmail.com', password: 'ilia')
  parsed_response['events']['event'].each do |e|
    latitude = e['latitude']
    longitude = e['longitude']
    name = e['title']
    location = e['venue_address']
    time = e['start_time']
    date = e['start_time']
    description = e['description']
    picurl = e['image']['blackborder500']['url']
    a = Event.new(description: description, user: User.find(placeholderuser), price: 20,  latitude: latitude, longitude: longitude, name: name, location: location, time: time, date: date, picurl: picurl)
    a.save

  end

  # parsed_response['events'].each do |e|
  #   puts e[0]['latitude']
  # end

  # read data coming back preferably in json

  # For each record from API map to your fields and save

end



task :get_fb_events => :environment do
  token = 'EAAJvMHABPa8BALK8v2LDZA3YgbSZCpPQ3ZCsFGljZC6qmzEq75EordnB9qcYZBr4jZCHelTNdvycYneQGDV2AuiZBkGwBCEZC6H3bQqjssfToNlF1FLn8qHbiGJ4UOw4PDYdiHeNlLZCmuSHlHaF6amovA7daXAxwSSc37GiXOR9bzAZDZD'
   event_ids = HTTParty.get("https://graph.facebook.com/v2.9/search?pretty=0&q=toronto&type=event&limit=5&fields=id&access_token=#{token}")
   parsed_response = JSON.parse(event_ids.body)
   puts parsed_response['data']

   placeholderuser = User.create(email: 'ilia@gmail.com', password: 'ilia')

   parsed_response['data'].each do |e|
     event = e['id']
     byebug
     resp = HTTParty.get("https://graph.facebook.com/v2.7/#{event}?fields=photos%7Bwebp_images%7D%2Cname%2Cdescription%2Cplace%2Cticket_uri%2Cstart_time&access_token=#{token}")
     pictures = []
     resp['photos']['data'].each do |i|
       i['webp_images'].each do |picture|
         pic = []
         pic << picture['source']
         pic << picture['height']
         pic << picture['width']
         pictures << pic
       end
     end
     final = []
     pictures.each do |pic|
       if (800..1300).include?(pic[1]) && (1500..2200).include?(pic[2])
         final << pic
       end
     end

     picurl =  final.first[0]
     name =  resp['name']
     description = resp['description']
     location =  resp['place']['location']['street']
     latitude = resp['place']['location']['latitude']
     longitude = resp['place']['location']['longitude']
     time = resp['start_time']
     date = resp['start_time']
     a = Event.new(description: description, user: User.find(placeholderuser), price: 20,  latitude: latitude, longitude: longitude, name: name, location: location, time: time, date: date, picurl: picurl)
     a.save
     sleep 1
    end


end
