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
