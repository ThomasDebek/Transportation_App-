p "Create new Transportation and clear old DB"

# Czyszczenie bazy danych
Schedule.destroy_all
LineStop.destroy_all
Line.destroy_all
Stop.destroy_all

# Przystanki
stops = [
  Stop.create(name: "Central Station", latitude: 40.7128, longitude: -74.0060, on_demand: false),
  Stop.create(name: "Park Avenue", latitude: 40.7138, longitude: -74.0050, on_demand: true),
  Stop.create(name: "Main Street", latitude: 40.7148, longitude: -74.0040, on_demand: false),
  Stop.create(name: "Broadway", latitude: 40.7158, longitude: -74.0030, on_demand: true),
  Stop.create(name: "Riverside", latitude: 40.7168, longitude: -74.0020, on_demand: false),
  Stop.create(name: "East Side", latitude: 40.7178, longitude: -74.0010, on_demand: true),
  Stop.create(name: "West End", latitude: 40.7188, longitude: -74.0000, on_demand: false),
  Stop.create(name: "Hilltop", latitude: 40.7198, longitude: -73.9990, on_demand: true),
  Stop.create(name: "Downtown", latitude: 40.7208, longitude: -73.9980, on_demand: false),
  Stop.create(name: "Uptown", latitude: 40.7218, longitude: -73.9970, on_demand: true)
]

# Linie autobusowe
lines = [
  Line.create(name: "Line A", type_of_vehicle: "Bus", low_floor: true),
  Line.create(name: "Line B", type_of_vehicle: "Tram", low_floor: false),
  Line.create(name: "Line C", type_of_vehicle: "Bus", low_floor: true),
  Line.create(name: "Line D", type_of_vehicle: "Tram", low_floor: false),
  Line.create(name: "Line E", type_of_vehicle: "Bus", low_floor: true)
]

# Dodawanie przystanków do linii
lines.each_with_index do |line, idx|
  sequence = 1
  selected_stops = stops.sample(rand(4..8)) # Każda linia ma od 4 do 8 przystanków
  selected_stops.each do |stop|
    LineStop.create(line: line, stop: stop, sequence: sequence)
    sequence += 1
  end
end

# Tworzenie rozkładów jazdy
lines.each do |line|
  line.line_stops.each do |line_stop|
    Schedule.create(
      line: line,
      stop: line_stop.stop,
      direction: %w[to\ City to\ Suburbs].sample,
      time: "#{rand(5..23)}:#{format('%02d', rand(0..59))}" # Losowa godzina
    )
  end
end

p "Seed data successfully added!"