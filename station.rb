# Your code goes here
require 'json'
require 'net/http'
#require 'Math'

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

#function that calculates distance between two points
def get_distance(lat1, long1, lat2, long2)
	distance = 0
	distance = Math.sqrt((lat2 - lat1)**2 + (long2-long1)**2)
	return distance
end

#function that gets the lat, long, stationName, availBikes
# of all the Divvy stations, and returns them in data hash format
#{id => [lat, long, stationname]}
def get_Divvy()
	url = 'https://feeds.divvybikes.com/stations/stations.json'
	#read json object from url into Ruby HASH
	uri = URI(url)
	response = Net::HTTP.get(uri)
	data_hash = JSON.parse(response)
	stations = data_hash["stationBeanList"]
	clean_data = {}
	id = 0
	lat = 0
	long = 0
	station_name = 'nothing'
	stations.each do |station|
		id = station["id"]
		lat = station["latitude"]
		long = station["longitude"]
		station_name = station["stationName"]
		bikes = station["availableBikes"]
		clean_data[id] = [lat, long, station_name, bikes]
	end
	return clean_data
end

address = File.open("address.txt").first

api_key = '&key=AIzaSyCK_MBgKTXZjpWvLvb5WpxmNk2mafDNcfo'
base_url = 'https://maps.googleapis.com/maps/api/geocode/json?address='
request = base_url + address + api_key

coordinates = get_coordinates(request)
station_lat = 0
station_long = 0
address_lat = coordinates[0]
address_long = coordinates[1]
dist = 0
station_values = []
divvy_data = get_Divvy()
divvy_data.each do |key, value|
	station_lat = value[0]
	station_long = value[1]
	dist = get_distance(station_lat, station_long, address_lat, address_long)
	tuple = [value[2], dist, value[3]]
	station_values.push(tuple)
end

min_dist = 123123123
min_station = 'nothing'
availBikes = 0
station_values.each do |station|
	value = station[1]
	if value < min_dist
		min_dist = value
		min_station = station[0]
		availBikes = station[2]
	end
end

puts min_station
puts "Available Bikes: #{availBikes}"


