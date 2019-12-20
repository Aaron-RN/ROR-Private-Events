class Event < ApplicationRecord
  belongs_to :creator, class_name: 'User', foreign_key: 'user_id'
  has_many :attendance
  has_many :attendees, through: :attendance, source: :user 
end
