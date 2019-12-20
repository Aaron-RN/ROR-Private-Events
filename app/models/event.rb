class Event < ApplicationRecord
  belongs_to :creator, class_name: 'User', foreign_key: 'user_id'
  has_many :attendance
  has_many :attendees, through: :attendance, source: :user
  scope :past_events, -> { where("date <?", Date.today) }
  scope :upcoming_events, -> { where("date >=?", Date.today) }
end
