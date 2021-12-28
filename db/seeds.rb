

45.times do |i|
  Seat.create!(
    {plane_id: "ATEST123",
    seat_id: i,
    area: "A"})
end
90.times do |i|
  Seat.create!(
    {plane_id: "ATEST123",
    seat_id: i,
    area: "B"})
end
45.times do |i|
  Seat.create!(
    {plane_id: "ATEST123",
    seat_id: i,
    area: "C"})
end

#total_price= (depHash["price"]+returnHash["price"])*28.ceil()
#ticket_id = dep_ticket_id + ari_ticket_id

