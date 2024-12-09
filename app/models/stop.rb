class Stop < ApplicationRecord
  has_many :line_stops
  has_many :lines, through: :line_stops
  has_many :schedules
end
