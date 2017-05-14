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

   event_ids = HTTParty.get("https://graph.facebook.com/v2.9/search?pretty=0&q=toronto&type=event&limit=50&fields=id&access_token=EAACEdEose0cBAHYZCBZBhUZAH05MTa9pxbJA2SoDjbZBGFdSipjyaHT0UviFdr0gNMblmAETCrKgUQ0bSOMdHamxOkZCYKFl3ZAGxIUkeLZAeGZAnq8zxuM8ml1HuC6thYbuYFyrHsrfUiZBAVn1d0Avg1pjQo2tyHwQyPZA56n2suJ8chXw2ZBZBWE6BE57INtr9lwZD")



   resp = HTTParty.get("https://graph.facebook.com/v2.7/570741246443984?fields=photos%7Bwebp_images%7D&access_token=EAACEdEose0cBAHYZCBZBhUZAH05MTa9pxbJA2SoDjbZBGFdSipjyaHT0UviFdr0gNMblmAETCrKgUQ0bSOMdHamxOkZCYKFl3ZAGxIUkeLZAeGZAnq8zxuM8ml1HuC6thYbuYFyrHsrfUiZBAVn1d0Avg1pjQo2tyHwQyPZA56n2suJ8chXw2ZBZBWE6BE57INtr9lwZD")
   puts resp


end
