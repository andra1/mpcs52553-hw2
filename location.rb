# Your code goes here
require 'json'
require 'net/http'

#First read in address from address.txt file

def get_json(url)
	uri = URI(url)
	response = Net::HTTP.get(uri)
	data_hash = JSON.parse(response)
	#puts data_hash
	return data_hash
end

address = File.open("address.txt").first

api_key = '&key=AIzaSyCK_MBgKTXZjpWvLvb5WpxmNk2mafDNcfo'
base_url = 'https://maps.googleapis.com/maps/api/geocode/json?address='
request = base_url + address + api_key

data = get_json(request)

lat = 0
long = 0
data["results"].each do |field|
	lat = field["geometry"]["location"]["lat"]
	long = field["geometry"]["location"]["lng"]
end

puts lat
puts long