require 'json'

task :get_events do
  # Connect to api

  # Issue API query
  response = HTTParty.get('http://api.eventful.com/json/events/search?...&app_key=qSvMLQqzs4QkKqTG&location=Toronto,%20Ontario,Canada&date=Future&sort_order=popularity&sort_direction=descending&page_size=1&image_sizes=blackborder500')

  #puts response.body, response.code, response.message, response.headers.inspect

  parsed_response = JSON.parse(response.body)

  parsed_response['events'].each do |e|
    latitude =  e['latitude']
    puts latitude
  end


  # read data coming back preferably in json

  # For each record from API map to your fields and save

end
