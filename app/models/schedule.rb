class Schedule < ApplicationRecord
  belongs_to :line
  belongs_to :stop
end
