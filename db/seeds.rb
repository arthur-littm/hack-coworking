require 'csv'

UnavailabilityDesk.destroy_all
UnavailabilityRoom.destroy_all
BookingDeskTag.destroy_all
BookingDesk.destroy_all
BookingRoom.destroy_all
AreaTag.destroy_all
Tag.destroy_all
Desk.destroy_all
Room.destroy_all
Area.destroy_all
User.destroy_all


puts 'Creating tags'

tags = [['Cool','Cool area'], ['Bar','Close to the bar'],['Animals','Near animals'],['Lively','Lively'],['Food','Food Allowed'],['Booth', 'Near booth'],['WiFi', 'High speed wifi'],['Warm', 'Warm area'],['Silent','Quiet area']]

tags.each { |tag| Tag.create(name: tag[0], description: tag[1]) }

Area.create(name: 'Le Wagon', desk_number: 42)

puts 'Uploading from CSV'
csv_text = File.read(Rails.root.join('lib', 'seeds', 'area_list.csv'))
csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')

csv.each do |row|
  area = row.to_hash
  case area['SpaceTypeCategoryName']
  when 'Common area'
    Area.create(name: area['AreaLabel'], desk_number: area['Capacity'].to_i)
  when 'Meeting room'
    Room.create(name: area['AreaLabel'], capacity: area['Capacity'].to_i, area: Area.all.sample)
  when 'Office'
    Area.create(name: area['AreaLabel'], desk_number: area['Capacity'].to_i)
  end
end

puts 'Generating desks and tags'

Area.all.each do |area|
  area.desk_number.times do |x|
    Desk.create(name: "Desk #{x}", area: area)
  end
  tags_array = Tag.take(rand(4))
  tags_array.each do |tag|
    AreaTag.create(tag: tag, area: area)
  end
end

names = %w(Alex Ben Arthur Angele Jonny)
jobs = ["Fullstack Developer", "Backend Developer", "Frontend Developer", "Project Manager", "Fullstack Developer"]
password = "123456"
photos = %w(https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/gu4bk6upus7v3u1wino8.jpg
 https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/ixr9unj1pvqtkfbzvlcu.jpg
 https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/onkzo1zsbde5taheslax.jpg
 https://avatars3.githubusercontent.com/u/26596127?v=4
 https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/pmgbbo7z4bel8x732lsz.jpg)


5.times do |e|

  user = User.create!(name: names[e], job: jobs[e], password: password, email: "#{names[e].downcase}@gmail.com", photo: photos[e])
  BookingDesk.create(desk: Area.first.desks.sample, user: user, starts_at: Date.today, ends_at: Date.today)

  (user.name == "Jonny" ? 1 : [0, 1].sample).times do
    BookingRoom.create(user: user, room: Room.all.sample, starts_at: DateTime.now + 2.hours, ends_at: DateTime.now + 3.hours)
  end

  users = User.all

  Lunch.create(proposer: User.where(name: "Jonny").first, receiver: users[0])
  Lunch.create(proposer: User.where(name: "Jonny").first, receiver: users[1])
  p user

end






