# Your code goes here
require 'json'
require 'net/http'

def get_coordinates(url)
	uri = URI(url)
	response = Net::HTTP.get(uri)
	data = JSON.parse(response)
	lat = 0
	long = 0
	data["results"].each do |field|
		lat = field["geometry"]["location"]["lat"]
		long = field["geometry"]["location"]["lng"]
	end
	return lat, long
end



def get_distance(lat1, long1, lat2, long2)
	distance = 0
	distance = Math.sqrt((lat2 - lat1)**2 + (long2-long1)**2)
	return distance
end

address = File.open("address.txt").first

api_key = '&key=AIzaSyCK_MBgKTXZjpWvLvb5WpxmNk2mafDNcfo'
base_url = 'https://maps.googleapis.com/maps/api/geocode/json?address='
request = base_url + address + api_key

coordinates = get_coordinates(request)
address_lat = coordinates[0]
address_long = coordinates[1]

value = get_distance(address_lat, address_long, 45.1, 37.3)
puts value