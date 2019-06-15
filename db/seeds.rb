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


