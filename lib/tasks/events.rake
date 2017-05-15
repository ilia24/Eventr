require 'json'

task :get_fb_events => :environment do
  limit = 200
  token = 'EAAJvMHABPa8BALK8v2LDZA3YgbSZCpPQ3ZCsFGljZC6qmzEq75EordnB9qcYZBr4jZCHelTNdvycYneQGDV2AuiZBkGwBCEZC6H3bQqjssfToNlF1FLn8qHbiGJ4UOw4PDYdiHeNlLZCmuSHlHaF6amovA7daXAxwSSc37GiXOR9bzAZDZD'
   event_ids = HTTParty.get("https://graph.facebook.com/v2.9/search?pretty=0&q=toronto&type=event&limit=#{limit}&fields=id&access_token=#{token}")
   parsed_response = JSON.parse(event_ids.body)
   puts parsed_response

   placeholderuser = User.create(email: 'ilia@gmail.com', password: 'ilia')

   parsed_response['data'].each do |e|
     event = e['id']
     puts e['id']
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

     if final.empty?
       next
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
     valid = 1

      Event.all.each do |e|
        if e.name == a[:name] && e.date == a[:date]
          valid = 0
        end
      end

      if valid == 1
        a.save
      else
        puts "Duplicate event #{name} not saved"
      end

    end


end
