

# require 'uri'
# require 'net/http'
# require 'openssl'
# require 'json'

# url = URI("https://google-flights-search.p.rapidapi.com/search?departure_airport_code=HND&arrival_airport_code=TPE&departure_date=2022-02-17&flight_class=Economy")

# http = Net::HTTP.new(url.host, url.port)
# http.read_timeout = 300
# http.use_ssl = true
# http.verify_mode = OpenSSL::SSL::VERIFY_NONE

# request = Net::HTTP::Get.new(url)
# request["x-rapidapi-host"] = 'google-flights-search.p.rapidapi.com'
# request["x-rapidapi-key"] = 'c067a891e9mshd45d05f401c5d35p147faejsnfa19082c68ac'

# response = http.request(request)
# tpejpn_flight_hash = JSON.parse(response.body)

# tj_flight_data = tpejpn_flight_hash["flights"]
# tempPrice = 10000
# tjHash= {}
# for flight in tj_flight_data
#   if flight["price"]< tempPrice
#   tempPrice = flight["price"]
#   tjHash = flight
#   end
# end

# tpejpn_price = tjHash["price"]*0.35*28
first_airport_code = "TPE" #tjHash["departure_airport_code"]
second_airport_code = "HND" #tjHash["arrival_airport_code"]
ticket_amount = 7390 #tpejpn_price

# jpjan = [17, 20, 22, 24, 27, 29, 31]
# jpfeb = [ 3, 5, 7, 10, 12, 14, 17, 19, 21, 24, 26, 28]
jpmar = [3, 5, 7, 10, 12, 14, 17, 19, 21, 24, 26, 28, 31]
jpapr = [4, 7, 9, 11, 14, 16, 18, 21, 23, 25, 28, 30]
jpmay = [2, 5, 7, 9, 12, 14, 16, 19, 21, 23, 26, 28, 30]
# jpjune = [2, 4, 6, 9, 11, 13, 16, 18, 20, 23, 25, 27, 30]
# jpjuly = [2, 4, 7, 9, 11, 14, 16, 18, 21, 23, 25, 28, 30]
# jpaug = [1, 4, 6, 8, 11, 13, 15, 18, 20, 22, 25, 27, 29]
# jpsep = [1, 3, 5, 8, 10, 12, 15, 17, 19, 22, 24, 26, 29]
# jpoct = [3, 6, 8, 10, 13, 15, 17, 20, 22, 24, 27, 29, 31]
# jpnov = [3, 5, 7, 10, 12, 14, 17, 19, 21, 24, 26, 28]
# jpdec = [1, 3, 5, 8, 10, 12, 15, 17, 19, 22, 24, 26, 29, 31]


for month in 3..5 do
  if month == 3
    for date in jpmar 
      departure_date = "2022-#{month.to_s.rjust(2,"0")}-#{date.to_s.rjust(2,"0")}"
      return_date = "2022-#{month.to_s.rjust(2,"0")}-#{date.to_s.rjust(2, "0")}"
      ticket_id = first_airport_code + second_airport_code + (departure_date).split('-').join
      Ticket.create(
        ticket_type: "單程",
        ticket_serial: ticket_id,
        departure: first_airport_code,
        arrival: second_airport_code,
        departure_date: departure_date,
        ticket_amount: ticket_amount,
        departure_time:"9:10 AM",
        arrival_time:"11:45 AM",
        cabin_class: "Economy",
        quantity: 108
      ) 
      re_date = "2022-#{month.to_s.rjust(2,"0")}-#{date.to_s.rjust(2, "0")}"
      reticket_id = second_airport_code + first_airport_code + (re_date).split('-').join
      Ticket.create(
        ticket_type: "單程",
        ticket_serial: reticket_id,
        departure: second_airport_code,
        arrival: first_airport_code,
        departure_date: re_date,
        ticket_amount: ticket_amount,
        departure_time:"7:10 PM",
        arrival_time:"10:05 PM",
        cabin_class: "Economy",
        quantity: 108
      )
    end
  elsif month == 4
    for date in jpapr #Feb has 28 days
      departure_date = "2022-#{month.to_s.rjust(2,"0")}-#{date.to_s.rjust(2,"0")}"
      return_date = "2022-#{month.to_s.rjust(2,"0")}-#{date.to_s.rjust(2, "0")}"
      ticket_id = first_airport_code + second_airport_code + (departure_date).split('-').join
      Ticket.create(
        ticket_type: "單程",
        ticket_serial: ticket_id,
        departure: first_airport_code,
        arrival: second_airport_code,
        departure_date: departure_date,
        ticket_amount: ticket_amount,
        departure_time:"9:10 AM",
        arrival_time:"11:45 AM",
        cabin_class: "Economy",
        quantity: 108
      ) 
      re_date = "2022-#{month.to_s.rjust(2,"0")}-#{date.to_s.rjust(2, "0")}"
      reticket_id = second_airport_code + first_airport_code + (re_date).split('-').join
      Ticket.create(
        ticket_type: "單程",
        ticket_serial: reticket_id,
        departure: second_airport_code,
        arrival: first_airport_code,
        departure_date: re_date,
        ticket_amount: ticket_amount,
        departure_time:"7:10 PM",
        arrival_time:"10:05 PM",
        cabin_class: "Economy",
        quantity: 108
      )
    end
  elsif month == 5
    for date in jpmay #Feb has 28 days
      departure_date = "2022-#{month.to_s.rjust(2,"0")}-#{date.to_s.rjust(2,"0")}"
      return_date = "2022-#{month.to_s.rjust(2,"0")}-#{date.to_s.rjust(2, "0")}"
      ticket_id = first_airport_code + second_airport_code + (departure_date).split('-').join
      Ticket.create(
        ticket_type: "單程",
        ticket_serial: ticket_id,
        departure: first_airport_code,
        arrival: second_airport_code,
        departure_date: departure_date,
        ticket_amount: ticket_amount*0.9,
        departure_time:"9:10 AM",
        arrival_time:"11:45 AM",
        cabin_class: "Economy",
        quantity: 108
      ) 
      re_date = "2022-#{month.to_s.rjust(2,"0")}-#{date.to_s.rjust(2, "0")}"
      reticket_id = second_airport_code + first_airport_code + (re_date).split('-').join
      Ticket.create(
        ticket_type: "單程",
        ticket_serial: reticket_id,
        departure: second_airport_code,
        arrival: first_airport_code,
        departure_date: re_date,
        ticket_amount: ticket_amount*0.9,
        departure_time:"7:10 PM",
        arrival_time:"10:05 PM",
        cabin_class: "Economy",
        quantity: 108
      )
    end
  end
end 

for date1 in jpmar 
  i = 3
  for n in 3..5 do
    if n == 3
      for date2 in jpmar 
        departure_date = "2022-#{i.to_s.rjust(2,"0")}-#{date1.to_s.rjust(2,"0")}"
        re_date = "2022-#{n.to_s.rjust(2,"0")}-#{date2.to_s.rjust(2, "0")}"
        ticket_id = first_airport_code + second_airport_code + (departure_date).split('-').join
        reticket_id = second_airport_code + first_airport_code + (re_date).split('-').join
        roundtrip_ticket_id = ticket_id + reticket_id
        roundtrip_price = ticket_amount*2.2  
        if date1 <= date2
          Ticket.create(
              ticket_type: "來回",
              ticket_amount: roundtrip_price,
              ticket_serial: roundtrip_ticket_id,
              departure: first_airport_code,
              arrival: second_airport_code,
              departure_date: departure_date,
              departure_time:"9:10 AM",
              arrival_time:"11:45 AM",
              return_departure_airport: second_airport_code,
              return_arrival_airport: first_airport_code,
              returning_date: re_date,
              return_departure_time:"7:30 PM",
              return_arrival_time:"10:05 PM",
              cabin_class: "Economy",
              quantity: 108
          )
        end
      end
    elsif n == 4
      for date2 in jpapr 
        departure_date = "2022-#{i.to_s.rjust(2,"0")}-#{date1.to_s.rjust(2,"0")}"
        re_date = "2022-#{n.to_s.rjust(2,"0")}-#{date2.to_s.rjust(2, "0")}"
        ticket_id = first_airport_code + second_airport_code + (departure_date).split('-').join
        reticket_id = second_airport_code + first_airport_code + (re_date).split('-').join
        roundtrip_ticket_id = ticket_id + reticket_id
        roundtrip_price = ticket_amount*2.2  
        Ticket.create(
            ticket_type: "來回",
            ticket_amount: roundtrip_price,
            ticket_serial: roundtrip_ticket_id,
            departure: first_airport_code,
            arrival: second_airport_code,
            departure_date: departure_date,
            departure_time:"9:10 AM",
            arrival_time:"11:45 AM",
            return_departure_airport: second_airport_code,
            return_arrival_airport: first_airport_code,
            returning_date: re_date,
            return_departure_time:"7:30 PM",
            return_arrival_time:"10:05 PM",
            cabin_class: "Economy",
            quantity: 108
        )
      end
    elsif n == 5
      for date2 in jpmay 
        departure_date = "2022-#{i.to_s.rjust(2,"0")}-#{date1.to_s.rjust(2,"0")}"
        re_date = "2022-#{n.to_s.rjust(2,"0")}-#{date2.to_s.rjust(2, "0")}"
        ticket_id = first_airport_code + second_airport_code + (departure_date).split('-').join
        reticket_id = second_airport_code + first_airport_code + (re_date).split('-').join
        roundtrip_ticket_id = ticket_id + reticket_id
        roundtrip_price = ticket_amount*2.2  
        Ticket.create(
            ticket_type: "來回",
            ticket_amount: roundtrip_price,
            ticket_serial: roundtrip_ticket_id,
            departure: first_airport_code,
            arrival: second_airport_code,
            departure_date: departure_date,
            departure_time:"9:10 AM",
            arrival_time:"11:45 AM",
            return_departure_airport: second_airport_code,
            return_arrival_airport: first_airport_code,
            returning_date: re_date,
            return_departure_time:"7:30 PM",
            return_arrival_time:"10:05 PM",
            cabin_class: "Economy",
            quantity: 108
        )
      end
    end
  end
end

for date1 in jpapr 
  i = 4
  for n in 4..12 do
    if n == 4
      for date2 in jpapr 
        departure_date = "2022-#{i.to_s.rjust(2,"0")}-#{date1.to_s.rjust(2,"0")}"
        re_date = "2022-#{n.to_s.rjust(2,"0")}-#{date2.to_s.rjust(2, "0")}"
        ticket_id = first_airport_code + second_airport_code + (departure_date).split('-').join
        reticket_id = second_airport_code + first_airport_code + (re_date).split('-').join
        roundtrip_ticket_id = ticket_id + reticket_id
        roundtrip_price = ticket_amount*2.2  
        if date1 <= date2
          Ticket.create(
              ticket_type: "來回",
              ticket_amount: roundtrip_price,
              ticket_serial: roundtrip_ticket_id,
              departure: first_airport_code,
              arrival: second_airport_code,
              departure_date: departure_date,
              departure_time:"9:10 AM",
              arrival_time:"11:45 AM",
              return_departure_airport: second_airport_code,
              return_arrival_airport: first_airport_code,
              returning_date: re_date,
              return_departure_time:"7:30 PM",
              return_arrival_time:"10:05 PM",
              cabin_class: "Economy",
              quantity: 108
          )
        end
      end
    elsif n == 5
      for date2 in jpmay 
        departure_date = "2022-#{i.to_s.rjust(2,"0")}-#{date1.to_s.rjust(2,"0")}"
        re_date = "2022-#{n.to_s.rjust(2,"0")}-#{date2.to_s.rjust(2, "0")}"
        ticket_id = first_airport_code + second_airport_code + (departure_date).split('-').join
        reticket_id = second_airport_code + first_airport_code + (re_date).split('-').join
        roundtrip_ticket_id = ticket_id + reticket_id
        roundtrip_price = ticket_amount*2.2  
        Ticket.create(
            ticket_type: "來回",
            ticket_amount: roundtrip_price,
            ticket_serial: roundtrip_ticket_id,
            departure: first_airport_code,
            arrival: second_airport_code,
            departure_date: departure_date,
            departure_time:"9:10 AM",
            arrival_time:"11:45 AM",
            return_departure_airport: second_airport_code,
            return_arrival_airport: first_airport_code,
            returning_date: re_date,
            return_departure_time:"7:30 PM",
            return_arrival_time:"10:05 PM",
            cabin_class: "Economy",
            quantity: 108
        )
      end
    end
  end
end


for date1 in jpmay 
  i = 5
    for date2 in jpmay 
      departure_date = "2022-#{i.to_s.rjust(2,"0")}-#{date1.to_s.rjust(2,"0")}"
      re_date = "2022-#{n.to_s.rjust(2,"0")}-#{date2.to_s.rjust(2, "0")}"
      ticket_id = first_airport_code + second_airport_code + (departure_date).split('-').join
      reticket_id = second_airport_code + first_airport_code + (re_date).split('-').join
      roundtrip_ticket_id = "R"+ first_airport_code + second_airport_code + ticket_id[10..] + reticket_id[10..]
      roundtrip_price = ticket_amount*2*0.4  
      if date1 <= date2
        Ticket.create(
            ticket_type: "來回",
            ticket_amount: roundtrip_price,
            ticket_serial: roundtrip_ticket_id,
            departure: first_airport_code,
            arrival: second_airport_code,
            departure_date: departure_date,
            departure_time:"9:10 AM",
            arrival_time:"11:45 AM",
            return_departure_airport: second_airport_code,
            return_arrival_airport: first_airport_code,
            returning_date: re_date,
            return_departure_time:"7:30 PM",
            return_arrival_time:"10:05 PM",
            cabin_class: "Economy",
            quantity: 108
        )
      end
    end
end

tickets = Ticket.where(ticket_type: "單程").pluck(:id)
tickets.each do |s|
    45.times do |i|
    Seat.create( 
      area:"A", 
      seat_no:i+1 ,
      ticket_id:s
    )
    Seat.create( 
      area:"B", 
      seat_no:i+1 ,
      ticket_id:s
    )
    Seat.create( 
      area:"C", 
      seat_no:i+1 ,
      ticket_id:s
    )
    Seat.create( 
      area:"D", 
      seat_no:i+1 ,
      ticket_id:s
    )
  end
end