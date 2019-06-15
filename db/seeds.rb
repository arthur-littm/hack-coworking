BookingDeskTag.destroy_all
Tag.destroy_all
Desk.destroy_all
Area.destroy_all

Tag.create(name: "Cool area")
Tag.create(name: "Close to the bar")
Tag.create(name: "Near animals")
Tag.create(name: "Silent")
Tag.create(name: "Lively")
Tag.create(name: "Warm area")
Tag.create(name: "Far from animals")
Tag.create(name: "High speed wifi")
Tag.create(name: "Food allowed")
Tag.create(name: "Near booth")

area = Area.create!(name: "Creative Hub, Floor 1", desk_number: 5)
10.times do |i|
  Desk.create!(name: "Desk #{i}", area: area)
  p i
end
