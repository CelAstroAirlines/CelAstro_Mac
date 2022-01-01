
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


first_airport_code = "TPE"
second_airport_code = "HND"
departure_date = "01/17/2022"
ticket_id = first_airport_code + second_airport_code + (departure_date).split('/').join
ticket_amount = 18500

Ticket.create(
  ticket_type: "one_way",
  ticket_serial: ticket_id,
  departure: first_airport_code,
  arrival: second_airport_code,
  departure_date: departure_date,
  ticket_amount: ticket_amount,
  departure_time:"9:10 AM",
  arrival_time:"11:45 AM"
)

re_date = "02/17/2022"
reticket_id = second_airport_code + first_airport_code + (re_date).split('/').join


Ticket.create(
  ticket_type: "one_way",
  ticket_serial: reticket_id,
  departure: second_airport_code,
  arrival: first_airport_code,
  departure_date: re_date,
  ticket_amount: ticket_amount,
  departure_time:"7:10 PM",
  arrival_time:"10:05 PM"
)

roundtrip_price = (ticket_amount*2*0.7)
roundtrip_ticket_id = "R"+ ticket_id[0..9] + reticket_id[6..9] 

Ticket.create(
  ticket_type: "roundtrip",
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
  return_arrival_time:"10:05 PM"
)

