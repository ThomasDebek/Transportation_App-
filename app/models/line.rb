class Line < ApplicationRecord
  has_many :line_stops
  has_many :stops, through: :line_stops
  has_many :schedules
end
