module RoomsHelper
  def generate_room_background
    ['https://images.pexels.com/photos/416320/pexels-photo-416320.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500', 'https://images.pexels.com/photos/296883/pexels-photo-296883.jpeg?auto=format%2Ccompress&cs=tinysrgb&dpr=2&w=500', 'https://images.pexels.com/photos/260928/pexels-photo-260928.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500','https://images.pexels.com/photos/159806/meeting-modern-room-conference-159806.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500'].sample
  end

  def user_can_afford_room?(user)
    user.current_balance >= 100
  end
end
