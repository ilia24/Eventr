require 'json'

task :get_fb_events => :environment do
  limit = 350
  token = 'EAAJvMHABPa8BALK8v2LDZA3YgbSZCpPQ3ZCsFGljZC6qmzEq75EordnB9qcYZBr4jZCHelTNdvycYneQGDV2AuiZBkGwBCEZC6H3bQqjssfToNlF1FLn8qHbiGJ4UOw4PDYdiHeNlLZCmuSHlHaF6amovA7daXAxwSSc37GiXOR9bzAZDZD'
   event_ids = HTTParty.get("https://graph.facebook.com/v2.9/search?pretty=0&q=toronto&type=event&limit=#{limit}&fields=id&access_token=#{token}")
   parsed_response = JSON.parse(event_ids.body)

  #  this establishs the base loop which iterates over all the accumulated ID's above
  #  and it also makes a base counter to be able to see things happenining in the console
   counter = 0

   parsed_response['data'].each do |e|
     event = e['id']
     puts e['id']
     puts "#{counter} Events grabbed & saved"
     resp = HTTParty.get("https://graph.facebook.com/v2.7/#{event}?fields=photos%7Bfrom%2Ccreated_time%2Cimages%7D%2Cname%2C%20description%2C%20place%2C%20ticket_uri%2C%20start_time%2Cadmins%7Bname%7D%2Ccover&access_token=#{token}")

    #  this makes the first series of authentication, it makes sure the pictures are uploaded from an admin account
     pictures = []
     admin_id_list = []
     whitelist = ["Electro Swing Toronto", "Live Nation Ontario", "Live Nation","Budweiser Stage","TicketBeast Canada", "TicketMaster"]

     if resp.dig('admins', 'data') == nil
       puts "Event has no admins, not saved"
       next
     else
       resp['admins']['data'].each do |dat|
         admin_id_list << dat['id']
       end
     end

    #  this takes each picture and puts them into one big array(as they are split up into weird hashes initially)
    if resp.dig('photos', 'data') == nil
      puts "Event has nil photos, not saved."
      next
    else
     resp['photos']['data'].each do |photo_data|
       if (admin_id_list.each.include? photo_data['from']['id']) || (whitelist.include? photo_data['from']['name'])
         photo_data['images'].each do |picture|
           pic = []
           pic << picture['source']
           pic << picture['height']
           pic << picture['width']
           pictures << pic
         end
       end
     end
   end

    #  this iterates through the array and picks out big, medium, and small pics
     bigpic = []
     mediumpic = []
     smallpic = []
     pictures.each do |pic|
       if (800..1400).include?(pic[1]) && (1400..2000).include?(pic[2])
         bigpic << pic
       elsif (500..800).include?(pic[1]) && (1000..1300).include?(pic[2])
         mediumpic << pic
       elsif (300..500).include?(pic[1]) && (400..800).include?(pic[2])
         smallpic << pic
       end
     end


# some final checks to make sure a nil array doesnt crash the final create function
     if smallpic.empty?
       pic = resp.dig('cover','source')
       smallpic << pic
     end

     if mediumpic.empty?
       mediumpic = nil
     end

     if bigpic.empty?
       bigpic = nil
     end

     if bigpic.nil? && mediumpic.nil?
       puts "#{resp.dig('name')} has zero valid pictures, event not saved"
       next
     end


# this just allows a medium, or a big pic to take over the role of the other if one is missing
     if bigpic != nil
       picurl =  bigpic.first[0]
     else
       picurl = mediumpic.first[0]
     end

     if mediumpic != nil
       picurl2 =  mediumpic.first[0]
     else
       picurl2 = bigpic.first[0]
     end


     if resp.dig('cover', 'source') == nil
       cover = mediumpic
     else
       cover = resp.dig('cover', 'source')
     end
     city = resp.dig('place', 'location', 'city')
     street = resp.dig('place', 'location', 'street')
     postcode = resp.dig('place', 'location', 'zip')
# this establishes the rest of the creation variables
     picurl3 =  smallpic.first[0]
     name =  resp['name']
     description = resp['description']

      if (street != nil) && (city != nil) && (postcode != nil)
        location = "#{street}, #{city}, #{postcode}"
      elsif (street != nil) && (city != nil)
        location = "#{street}, #{city}"
      elsif (street != nil) && (postcode != nil)
        location = "#{street}, #{postcode}"
      elsif (street != nil)
        location = "#{street}"
      else
        location = nil
      end

     latitude = resp.dig('place', 'location', 'latitude')
     longitude = resp.dig('place', 'location', 'longitude')
     time = resp['start_time']
     date = resp['start_time']
# this makes sure that the adress is workable within our system
     if (latitude.nil? && longitude.nil?) && location.nil?
       puts "#{name} has invalid address, event not saved"
       next
     end

# then this creates an event instance, double checks that there are no duplicates, then saves the event!
     a = Event.new(description: description, user: User.first, price: 20,  latitude: latitude, longitude: longitude, name: name, location: location, time: time, date: date, picurl: picurl, picurl2: picurl2, cover: cover, picurl3: picurl3)
     valid = 1

      Event.all.each do |e|
        if e.name == a[:name] && e.date == a[:date]
          valid = 0
        end
      end

      if valid == 1
        counter += 1
        a.save
      else
        puts "Duplicate event #{name} not saved"
      end

    end


end


# create validations on event model scoped in date (name uniq within date), instead of 124-135
# 66-103 no sense changing empty array to nil, just check if the array is nil!
# 32-62 replace array with hash, so i can use key-val pairs to denote source/width/height
# use figaro gem, to keep secrets off of git
