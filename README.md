# Homework #2

**DUE: Monday, Jan 22 5:30pm**

NOTE: THERE ARE HINTS AT THE BOTTOM OF THIS PAGE.

### Setup & How To Submit

If you have any questions about how to get setup or how to submit your homework,
simply start a new Discussion on Canvas; or if you prefer, send me a private
message using the "Inbox" feature in Canvas.


1. Get the code for this assignment by downloading a ZIP file of this repository.
2. Unzip into a folder on your computer, and (optional) rename the folder to `hw2`.
3. Turn the folder into a local git repository.
4. Create a new, remote *private* repository named `mpcs52553-hw2` inside of your GitHub or BitBucket account.
5. Push your local repository to the remote repository.
6. Solve the challenges below.  Commit your changes often to save your work.
7. Push commits as often as you want.  I will not clone your repository until the assignment is due.
8. Prior to the deadline, add me as a collaborator (read+write): `jeffcohen` (works for both GitHub and BitBucket)

### Challenge #1: Divvy Bike Count [1 pt]

* Divvy API: https://feeds.divvybikes.com/stations/stations.json

  Write a Ruby program named `bike_count.rb` that outputs the limit of the number of bikes
  in the entire Divvy system.  You can use `totalDocks` property of a station to calculate
  the maximum number of bikes per station.

  Example Output:

  ```
  $ ruby bike_count.rb
  726
  ```

  (that number is just an example and probably wrong - I haven't done the real calculation)

  Do not calculate the answer by hand and only use Ruby to output the answer.
  Your Ruby code must generate the answer itself starting with nothing except
  the API url above.



### Challenge #2: Geocoding [1 pt]

* Google API: https://developers.google.com/maps/documentation/geocoding/start

  Write a Ruby program named `location.rb` that reads an address from a file
  named `address.txt` and uses the Google Geocoding API to determine the latitude
  and longitude of the given address.

  Here is an example `address.txt` file:

  `1901 W. Madison St, Chicago, IL`

  Example Output:

  ```
  $ ruby location.rb
  41.8806285
  -87.6740482
  ```

### Challenge #3: Divvy Station Information Near an Address [3 pts]

Using what we've learned so far, write a Ruby program named `station.rb` that
reads an address from `address.txt` to determine the nearest Divvy station
and then displays the name of the station and the number of bikes available:

```
$ ruby station.rb
Damen Ave & Madison St
Available Bikes: 3
```

NOTE: To determine the distance between two lat-lng pairs, you can use the Pythagorean
formula.

### HINTS

* Use `irb` for experiments

* `require 'cgi'` has web-related utility functions. `CGI::escape(str)` will make any
  string usable for inclusion in a URL, for example.

* `require 'open-uri'` will let you open HTTP addresses as files:

  ```
  f = open("http://google.com")
  html = f.read()
  ```

* `require 'json'` will let you use the [JSON](http://ruby-doc.org/stdlib-2.4.0/libdoc/json/rdoc/JSON.html) class:

  ```
  f = open("https://maps.googleapis.com/maps/api/geocode/json?address=1600+Amphitheatre+Parkway,+Mountain+View,+CA")
  json = f.read()
  data = JSON.parse(json)
  ```

* Helpful Ruby methods:
  * `open()` opens a file for reading (will open `http` addresses if preceded with `require 'open-uri'`)
  * `.chomp` will remove a trailing `\n` character from a string
  * `puts`
  * `print`
  * `.inspect`
  * `.class`
