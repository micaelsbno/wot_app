class Event < ApplicationRecord
  has_many :user_events
  has_many :users, through: :user_events
  belongs_to :place
  has_many :event_times
  has_many :categories
end
