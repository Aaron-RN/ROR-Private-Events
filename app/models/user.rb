class User < ApplicationRecord
    has_many :events, inverse_of: 'creator'
    has_many :attendance
    has_many :attended_events, through: :attendance, source: :event
end
