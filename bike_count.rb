# Your code goes here
require 'json'
require 'net/http'

url = 'https://feeds.divvybikes.com/stations/stations.json'
#read json object from url into Ruby HASH
uri = URI(url)
response = Net::HTTP.get(uri)
data_hash = JSON.parse(response)
stations = data_hash["stationBeanList"]
count = 0

stations.each do |station|
	value = station["totalDocks"]
	count = count + value
end

puts count


