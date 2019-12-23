10.times do |n|
  name  = "Example User " + n.to_s 
  events_name  = "Example Events " + n.to_s 

  user = User.create!(username: name)
  if n <= 6
    event = user.events.create!(title: events_name, date: Date.today)
  else
    event = user.events.create!(title: events_name, date:"Sun, 22 Dec 2019")
  end
  event.attendance.create(user_id: user.id)
end









