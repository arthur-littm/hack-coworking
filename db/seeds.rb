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
jobs = ["Fullstack Developer", "Backend Developer", "Frontend Developer", "Project Manager" "Fullstack Developer"]
password = "123456"
photos = %w(https://scontent-lhr3-1.xx.fbcdn.net/v/t1.0-9/420519_4560049929059_1264826949_n.jpg?_nc_cat=104&_nc_ht=scontent-lhr3-1.xx&oh=eb7c751607a482cadb7919b30c8d6428&oe=5D7DEF5E,
 https://scontent-lhr3-1.xx.fbcdn.net/v/t1.0-9/51920747_10157127848197700_564219631653355520_n.jpg?_nc_cat=107&_nc_ht=scontent-lhr3-1.xx&oh=968e620ea92e28bc0195e1506991d0f4&oe=5D8B7BD6,
 https://scontent-lhr3-1.xx.fbcdn.net/v/t1.0-9/48380755_10157011725641177_1407507963114946560_o.jpg?_nc_cat=111&_nc_ht=scontent-lhr3-1.xx&oh=aaa16375a0fe0825e4bec9e3e2c4ae5c&oe=5D818344,
 https://scontent-lhr3-1.xx.fbcdn.net/v/t1.0-9/532276_10151986828882231_1063801770_n.jpg?_nc_cat=106&_nc_ht=scontent-lhr3-1.xx&oh=b89f4c1a9d46a13c452733a25b86b639&oe=5D79921E
 https://media.licdn.com/dms/image/C5603AQEk9TSJP9s2KQ/profile-displayphoto-shrink_800_800/0?e=1566432000&v=beta&t=HJdLg6OBPi4V02qYQrmFvgIcDiEbk-4XslU66xmsuu0)


5.times do |e|

  user = User.create!(name: names[e], job: jobs[e], password: password, email: "#{names[e].downcase}@gmail.com", photo: photos[e])
  BookingDesk.create(desk: Area.first.desks.sample, user: user, starts_at: Date.today, ends_at: Date.today)
  [0, 1].sample.times do
    BookingRoom.create(user: user, room: Room.all.sample, starts_at: DateTime.now + 2.hours, ends_at: DateTime.now + 3.hours)
  end
  p user

end






