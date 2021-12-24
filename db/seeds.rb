
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#require 'uri'
#require 'net/http'
#require 'openssl'
require 'json'

#url = URI("https://google-flights-search.p.rapidapi.com/search?departure_airport_code=HND&arrival_airport_code=TPE&departure_date=2022-02-17&flight_class=Economy")

#http = Net::HTTP.new(url.host, url.port)
#http.read_timeout = 300
#http.use_ssl = true
#http.verify_mode = OpenSSL::SSL::VERIFY_NONE

#request = Net::HTTP::Get.new(url)
#request["x-rapidapi-host"] = ENV["x-rapidapi-host"]
#request["x-rapidapi-key"] = ENV["x-rapidapi-key"]

#response = http.request(request)
#result = response.read_body

dep_hash = {"flights"=>[{"departure_airport_code"=>"TPE", "arrival_airport_code"=>"HND", "num_stops"=>1, "price"=>1895.0, "trip_duration"=>"33 hr 50 min", "departure_date"=>"01/17/2022", "departure_time"=>"9:10 AM", "arrival_time"=>"8:00 PM", "layovers"=>"27 hr 5 min at Manila (MNL)Overnight at ", "cabin_class"=>"Economy, Economy", "airlines"=>"EVA Air, ANA", "detail_url"=>"https://www.google.com/travel/flights/booking?tfs=CBwQAhpgagcIARIDVFBFEgoyMDIyLTAxLTE3cgcIARIDSE5EIh8KA1RQRRIKMjAyMi0wMS0xNxoDTU5MKgJCUjIDMjcxIh8KA01OTBIKMjAyMi0wMS0xOBoDSE5EKgJOSDIDODcwcAGCAQsI____________AUABSAGYAQI&tfu=CnRDalJJVkRad2VWUkVjekp4TVdOQlFuaFVkR2RDUnkwdExTMHRMUzB0TFMxd1puazRNRUZCUVVGQlIwaENaR0paUTA5dVdVRkJFZ3RDVWpJM01YeE9TRGczTUJvTENLRElDeEFDR2dOVlUwUTRISENneUFzPRIGCAEQABgA", "arrival_date"=>"01/18/2022"}, {"departure_airport_code"=>"TPE", "arrival_airport_code"=>"HND", "num_stops"=>1, "price"=>2369.0, "trip_duration"=>"15 hr 35 min", "departure_date"=>"01/17/2022", "departure_time"=>"1:55 PM", "arrival_time"=>"6:30 AM", "layovers"=>"6 hr at Bangkok (BKK)", "cabin_class"=>"Economy, Economy", "airlines"=>"THAI, ANA", "detail_url"=>"https://www.google.com/travel/flights/booking?tfs=CBwQAhpgagcIARIDVFBFEgoyMDIyLTAxLTE3cgcIARIDSE5EIh8KA1RQRRIKMjAyMi0wMS0xNxoDQktLKgJURzIDNjMzIh8KA0JLSxIKMjAyMi0wMS0xNxoDSE5EKgJOSDIDODUwcAGCAQsI____________AUABSAGYAQI&tfu=CnRDalJJV1dSdmVtZGZiamxrTW1OQlFqTkdiMEZDUnkwdExTMHRMUzB0TFMxd1puWTJOVUZCUVVGQlIwaENaR0pWVDI5bVowRkJFZ3RVUnpZek0zeE9TRGcxTUJvTENLeTZEaEFDR2dOVlUwUTRISENzdWc0PRIGCAEQABgA", "arrival_date"=>"01/18/2022"}, {"departure_airport_code"=>"TPE", "arrival_airport_code"=>"HND", "num_stops"=>1, "price"=>2741.0, "trip_duration"=>"30 hr 20 min", "departure_date"=>"01/17/2022", "departure_time"=>"2:20 PM", "arrival_time"=>"9:40 PM", "layovers"=>"19 hr at Singapore (SIN)Overnight at ", "cabin_class"=>"Economy, Economy", "airlines"=>"Singapore Airlines, Singapore Airlines", "detail_url"=>"https://www.google.com/travel/flights/booking?tfs=CBwQAhpgagcIARIDVFBFEgoyMDIyLTAxLTE3cgcIARIDSE5EIh8KA1RQRRIKMjAyMi0wMS0xNxoDU0lOKgJTUTIDODc3Ih8KA1NJThIKMjAyMi0wMS0xOBoDSE5EKgJTUTIDNjM0cAGCAQsI____________AUABSAGYAQI&tfu=CnRDalJJVmxkbE1ubGFUM05wVnpSQlFqTlRWV2RDUnkwdExTMHRMUzB0TFMxd1puWm9OVUZCUVVGQlIwaENaR0paUkRKd1IwRkJFZ3RUVVRnM04zeFRVVFl6TkJvTENOZmNFQkFDR2dOVlUwUTRISERYM0JBPRIGCAEQABgA", "arrival_date"=>"01/18/2022"}, {"departure_airport_code"=>"TPE", "arrival_airport_code"=>"HND", "num_stops"=>1, "price"=>3379.0, "trip_duration"=>"14 hr 45 min", "departure_date"=>"01/17/2022", "departure_time"=>"1:55 PM", "arrival_time"=>"5:40 AM", "layovers"=>"5 hr 15 min at Bangkok (BKK)", "cabin_class"=>"Economy, Economy", "airlines"=>"THAI, JAL", "detail_url"=>"https://www.google.com/travel/flights/booking?tfs=CBwQAhpfagcIARIDVFBFEgoyMDIyLTAxLTE3cgcIARIDSE5EIh8KA1RQRRIKMjAyMi0wMS0xNxoDQktLKgJURzIDNjMzIh4KA0JLSxIKMjAyMi0wMS0xNxoDSE5EKgJKTDICMzRwAYIBCwj___________8BQAFIAZgBAg&tfu=CnRDalJJWm1KMWFWZDVOVkEwWjNkQlFuWkxiRkZDUnkwdExTMHRMUzB0Y0dabWR6RTBNa0ZCUVVGQlIwaENaR0pyVG1SWU1FRkJFZ3BVUnpZek0zeEtURE0wR2dzSXBzOFVFQUlhQTFWVFJEZ2NjS2JQRkE9PRIGCAEQABgA", "arrival_date"=>"01/18/2022"}], "date"=>"2021-12-21T06:35:44.047746", "status"=>"success"}
ari_data = "{\"flights\": [{\"departure_airport_code\": \"HND\", \"arrival_airport_code\": \"TPE\", \"num_stops\": 1, \"price\": 750.0, \"trip_duration\": \"22 hr 5 min\", \"departure_date\": \"02/17/2022\", \"departure_time\": \"6:00 PM\", \"arrival_time\": \"3:05 PM\", \"layovers\": \"17 hr 40 min at OsakaOvernight at Transfer from ITM to KIX\", \"cabin_class\": \"Economy, Economy\", \"airlines\": \"JAL, EVA Air\", \"detail_url\": \"https://www.google.com/travel/flights/booking?tfs=CBwQAhpgagcIARIDSE5EEgoyMDIyLTAyLTE3cgcIARIDVFBFIh8KA0hORBIKMjAyMi0wMi0xNxoDSVRNKgJKTDIDMTMzIh8KA0tJWBIKMjAyMi0wMi0xOBoDVFBFKgJCUjIDMTMxcAGCAQsI____________AUABSAGYAQI&tfu=CnRDalJJZG5aSVFXVkpkVFJxYjFWQlEzVmFXR2RDUnkwdExTMHRMUzB0TFMxd1ptWjZOa0ZCUVVGQlIwaEVUVzlGUnpVdFowRkJFZ3RLVERFek0zeENVakV6TVJvTENOL0pCQkFDR2dOVlUwUTRISERmeVFRPRIGCAEQABgA\", \"arrival_date\": \"02/18/2022\"}, {\"departure_airport_code\": \"HND\", \"arrival_airport_code\": \"TPE\", \"num_stops\": 1, \"price\": 750.0, \"trip_duration\": \"20 hr 55 min\", \"departure_date\": \"02/17/2022\", \"departure_time\": \"7:10 PM\", \"arrival_time\": \"3:05 PM\", \"layovers\": \"16 hr 20 min at OsakaOvernight at Transfer from ITM to KIX\", \"cabin_class\": \"Economy, Economy\", \"airlines\": \"JAL, EVA Air\", \"detail_url\": \"https://www.google.com/travel/flights/booking?tfs=CBwQAhpgagcIARIDSE5EEgoyMDIyLTAyLTE3cgcIARIDVFBFIh8KA0hORBIKMjAyMi0wMi0xNxoDSVRNKgJKTDIDMTM5Ih8KA0tJWBIKMjAyMi0wMi0xOBoDVFBFKgJCUjIDMTMxcAGCAQsI____________AUABSAGYAQI&tfu=CnRDalJJZWtOWFVrSkVlRkJCWDFGQlEyZEZjMEZDUnkwdExTMHRMUzB0TFhCbVozTXlNRUZCUVVGQlIwaEVUVzlKU1Vsc1IwRkJFZ3RLVERFek9YeENVakV6TVJvTENOL0pCQkFDR2dOVlUwUTRISERmeVFRPRIGCAEQABgA\", \"arrival_date\": \"02/18/2022\"}, {\"departure_airport_code\": \"HND\", \"arrival_airport_code\": \"TPE\", \"num_stops\": 1, \"price\": 750.0, \"trip_duration\": \"21 hr 15 min\", \"departure_date\": \"02/17/2022\", \"departure_time\": \"6:50 PM\", \"arrival_time\": \"3:05 PM\", \"layovers\": \"16 hr 40 min at OsakaOvernight at Transfer from ITM to KIX\", \"cabin_class\": \"Economy, Economy\", \"airlines\": \"JAL, EVA Air\", \"detail_url\": \"https://www.google.com/travel/flights/booking?tfs=CBwQAhpgagcIARIDSE5EEgoyMDIyLTAyLTE3cgcIARIDVFBFIh8KA0hORBIKMjAyMi0wMi0xNxoDSVRNKgJKTDIDMTM3Ih8KA0tJWBIKMjAyMi0wMi0xOBoDVFBFKgJCUjIDMTMxcAGCAQsI____________AUABSAGYAQI&tfu=CnRDalJJYzFjek5EVmlaa2gwZVZsQlEzcFBZbmRDUnkwdExTMHRMUzB0TFMxd1ptVm1NMEZCUVVGQlIwaEVUVzlGVEU1SFdrRkJFZ3RLVERFek4zeENVakV6TVJvTENOL0pCQkFDR2dOVlUwUTRISERmeVFRPRIGCAEQABgA\", \"arrival_date\": \"02/18/2022\"}, {\"departure_airport_code\": \"HND\", \"arrival_airport_code\": \"TPE\", \"num_stops\": 1, \"price\": 750.0, \"trip_duration\": \"22 hr 35 min\", \"departure_date\": \"02/17/2022\", \"departure_time\": \"5:30 PM\", \"arrival_time\": \"3:05 PM\", \"layovers\": \"18 hr 15 min at OsakaOvernight at Transfer from ITM to KIX\", \"cabin_class\": \"Economy, Economy\", \"airlines\": \"JAL, EVA Air\", \"detail_url\": \"https://www.google.com/travel/flights/booking?tfs=CBwQAhpgagcIARIDSE5EEgoyMDIyLTAyLTE3cgcIARIDVFBFIh8KA0hORBIKMjAyMi0wMi0xNxoDSVRNKgJKTDIDMTMxIh8KA0tJWBIKMjAyMi0wMi0xOBoDVFBFKgJCUjIDMTMxcAGCAQsI____________AUABSAGYAQI&tfu=CnRDalJJY0c5d1NIWXlTRkF3Y1VWQlEzWk1SWGRDUnkwdExTMHRMUzB0TFMxd1ptVjZOa0ZCUVVGQlIwaEVUVzlGUkRkeldrRkJFZ3RLVERFek1YeENVakV6TVJvTENOL0pCQkFDR2dOVlUwUTRISERmeVFRPRIGCAEQABgA\", \"arrival_date\": \"02/18/2022\"}, {\"departure_airport_code\": \"HND\", \"arrival_airport_code\": \"TPE\", \"num_stops\": 1, \"price\": 750.0, \"trip_duration\": \"25 hr 5 min\", \"departure_date\": \"02/17/2022\", \"departure_time\": \"3:00 PM\", \"arrival_time\": \"3:05 PM\", \"layovers\": \"20 hr 45 min at OsakaOvernight at Transfer from ITM to KIX\", \"cabin_class\": \"Economy, Economy\", \"airlines\": \"JAL, EVA Air\", \"detail_url\": \"https://www.google.com/travel/flights/booking?tfs=CBwQAhpgagcIARIDSE5EEgoyMDIyLTAyLTE3cgcIARIDVFBFIh8KA0hORBIKMjAyMi0wMi0xNxoDSVRNKgJKTDIDMTI1Ih8KA0tJWBIKMjAyMi0wMi0xOBoDVFBFKgJCUjIDMTMxcAGCAQsI____________AUABSAGYAQI&tfu=CnRDalJJWWtkaFNYWkZOVnBOYkc5QlEzUXlWR2RDUnkwdExTMHRMUzB0TFhCbWFYVXhNMEZCUVVGQlIwaEVUVzlGUVRSaFowRkJFZ3RLVERFeU5YeENVakV6TVJvTENOL0pCQkFDR2dOVlUwUTRISERmeVFRPRIGCAEQABgA\", \"arrival_date\": \"02/18/2022\"}, {\"departure_airport_code\": \"HND\", \"arrival_airport_code\": \"TPE\", \"num_stops\": 1, \"price\": 750.0, \"trip_duration\": \"23 hr 35 min\", \"departure_date\": \"02/17/2022\", \"departure_time\": \"4:30 PM\", \"arrival_time\": \"3:05 PM\", \"layovers\": \"19 hr 15 min at OsakaOvernight at Transfer from ITM to KIX\", \"cabin_class\": \"Economy, Economy\", \"airlines\": \"JAL, EVA Air\", \"detail_url\": \"https://www.google.com/travel/flights/booking?tfs=CBwQAhpgagcIARIDSE5EEgoyMDIyLTAyLTE3cgcIARIDVFBFIh8KA0hORBIKMjAyMi0wMi0xNxoDSVRNKgJKTDIDMTI3Ih8KA0tJWBIKMjAyMi0wMi0xOBoDVFBFKgJCUjIDMTMxcAGCAQsI____________AUABSAGYAQI&tfu=CnRDalJJVEROVmNHNVZWRkF6ZHpCQlEyMDJOa0ZDUnkwdExTMHRMUzB0TFMwdGNHWjNPRUZCUVVGQlIwaEVUVzlGU1ZCR1QwRkJFZ3RLVERFeU4zeENVakV6TVJvTENOL0pCQkFDR2dOVlUwUTRISERmeVFRPRIGCAEQABgA\", \"arrival_date\": \"02/18/2022\"}, {\"departure_airport_code\": \"HND\", \"arrival_airport_code\": \"TPE\", \"num_stops\": 1, \"price\": 752.0, \"trip_duration\": \"19 hr 10 min\", \"departure_date\": \"02/17/2022\", \"departure_time\": \"8:55 PM\", \"arrival_time\": \"3:05 PM\", \"layovers\": \"14 hr 40 min at Osaka\\u00a0(KIX)Overnight at \", \"cabin_class\": \"Economy, Economy\", \"airlines\": \"JAL, EVA Air\", \"detail_url\": \"https://www.google.com/travel/flights/booking?tfs=CBwQAhpgagcIARIDSE5EEgoyMDIyLTAyLTE3cgcIARIDVFBFIh8KA0hORBIKMjAyMi0wMi0xNxoDS0lYKgJKTDIDMjI5Ih8KA0tJWBIKMjAyMi0wMi0xOBoDVFBFKgJCUjIDMTMxcAGCAQsI____________AUABSAGYAQI&tfu=CnRDalJJWkRGa09UQlVkVEZ3TkRSQlEzQldlV2RDUnkwdExTMHRMUzB0TFMxd1ptSm1Na0ZCUVVGQlIwaEVUVzQwUm5wU1FVRkJFZ3RLVERJeU9YeENVakV6TVJvTENQM0tCQkFDR2dOVlUwUTRISEQ5eWdRPRIGCAEQABgA\", \"arrival_date\": \"02/18/2022\"}, {\"departure_airport_code\": \"HND\", \"arrival_airport_code\": \"TPE\", \"num_stops\": 1, \"price\": 794.0, \"trip_duration\": \"18 hr 35 min\", \"departure_date\": \"02/17/2022\", \"departure_time\": \"9:30 PM\", \"arrival_time\": \"3:05 PM\", \"layovers\": \"14 hr 5 min at Osaka\\u00a0(KIX)Overnight at \", \"cabin_class\": \"Economy, Economy\", \"airlines\": \"ANA, EVA Air\", \"detail_url\": \"https://www.google.com/travel/flights/booking?tfs=CBwQAhphagcIARIDSE5EEgoyMDIyLTAyLTE3cgcIARIDVFBFIiAKA0hORBIKMjAyMi0wMi0xNxoDS0lYKgJOSDIEMzgyOSIfCgNLSVgSCjIwMjItMDItMTgaA1RQRSoCQlIyAzEzMXABggELCP___________wFAAUgBmAEC&tfu=CnRDalJJU2pkQk0xWkRSMGxKTVRSQlEycHZSM2RDUnkwdExTMHRMUzB0TFhCbWRURXpNMEZCUVVGQlIwaEVUVzlGVFdveFEwRkJFZ3hPU0RNNE1qbDhRbEl4TXpFYUN3am42d1FRQWhvRFZWTkVPQnh3NStzRRIGCAEQABgA\", \"arrival_date\": \"02/18/2022\"}, {\"departure_airport_code\": \"HND\", \"arrival_airport_code\": \"TPE\", \"num_stops\": 1, \"price\": 832.0, \"trip_duration\": \"19 hr 20 min\", \"departure_date\": \"02/17/2022\", \"departure_time\": \"7:30 PM\", \"arrival_time\": \"1:50 PM\", \"layovers\": \"14 hr 35 min at Fukuoka\\u00a0(FUK)Overnight at \", \"cabin_class\": \"Economy, Economy\", \"airlines\": \"JAL, EVA Air\", \"detail_url\": \"https://www.google.com/travel/flights/booking?tfs=CBwQAhpgagcIARIDSE5EEgoyMDIyLTAyLTE3cgcIARIDVFBFIh8KA0hORBIKMjAyMi0wMi0xNxoDRlVLKgJKTDIDMzM1Ih8KA0ZVSxIKMjAyMi0wMi0xOBoDVFBFKgJCUjIDMTA1cAGCAQsI____________AUABSAGYAQI&tfu=CnRDalJJVEROVmNHNVZWRkF6ZHpCQlEyMDJabEZDUnkwdExTMHRMUzB0TFMwdGNHWjNPRUZCUVVGQlIwaEVUVzR3VFdsUlNrRkJFZ3RLVERNek5YeENVakV3TlJvTENNaUpCUkFDR2dOVlUwUTRISERJaVFVPRIGCAEQABgA\", \"arrival_date\": \"02/18/2022\"}, {\"departure_airport_code\": \"HND\", \"arrival_airport_code\": \"TPE\", \"num_stops\": 1, \"price\": 888.0, \"trip_duration\": \"18 hr 50 min\", \"departure_date\": \"02/17/2022\", \"departure_time\": \"8:00 PM\", \"arrival_time\": \"1:50 PM\", \"layovers\": \"14 hr 20 min at Fukuoka\\u00a0(FUK)Overnight at \", \"cabin_class\": \"Economy, Economy\", \"airlines\": \"ANA, EVA Air\", \"detail_url\": \"https://www.google.com/travel/flights/booking?tfs=CBwQAhphagcIARIDSE5EEgoyMDIyLTAyLTE3cgcIARIDVFBFIiAKA0hORBIKMjAyMi0wMi0xNxoDRlVLKgJOSDIEMzg1NSIfCgNGVUsSCjIwMjItMDItMTgaA1RQRSoCQlIyAzEwNXABggELCP___________wFAAUgBmAEC&tfu=CnRDalJJY1ZsemNGSjRaSGREY25kQlEySmpOVkZDUnkwdExTMHRMUzB0TFMxd1puWXhOMEZCUVVGQlIwaEVUVzR3U0RObVdVRkJFZ3hPU0RNNE5UVjhRbEl4TURVYUN3aXN0UVVRQWhvRFZWTkVPQnh3ckxVRhIGCAEQABgA\", \"arrival_date\": \"02/18/2022\"}], \"date\": \"2021-12-22T14:13:48.281653\", \"status\": \"success\"}"

dep_flight_data = dep_hash["flights"]
tempPrice = 10000
depHash= {}
for flight in dep_flight_data
  if flight["price"]< tempPrice
  tempPrice = flight["price"]
  depHash = flight
  end
end
dep_ticket_id = (depHash["departure_airport_code"]+depHash["arrival_airport_code"]+ depHash["departure_date"]).split('/').join

Ticket.create(
  ticket_id: dep_ticket_id,
  departure: depHash["departure_airport_code"],
  arrival: depHash["arrival_airport_code"],
  departure_date: depHash["departure_date"],
  ticket_amount: (depHash["price"]*28)
)


myJson = JSON.parse(ari_data)
return_flight_data = myJson["flights"]
temp_price = 10000
returnHash= {}
for flight in return_flight_data
  if flight["price"]< temp_price
    temp_price = flight["price"]
    returnHash = flight
  end
end

ari_ticket_id = (returnHash["departure_airport_code"]+returnHash["arrival_airport_code"]+ returnHash["departure_date"]).split('/').join


Ticket.create(
  ticket_id: ari_ticket_id,
  departure: returnHash["departure_airport_code"],
  arrival: returnHash["arrival_airport_code"],
  departure_date: returnHash["departure_date"],
  ticket_amount: (returnHash["price"]*28)
)



#total_price= (depHash["price"]+returnHash["price"])*28.ceil()
#ticket_id = dep_ticket_id + ari_ticket_id

