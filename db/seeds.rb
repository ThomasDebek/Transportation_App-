p "Create new Transporstion and before clear old DB"
Schedule.destroy_all
LineStop.destroy_all
Line.destroy_all
Stop.destroy_all


stop1 = Stop.create(name: "Stop 1", latitude: 40.0, longitude: 45.0, on_demand: false)
stop2 = Stop.create(name: "Stop 2", latitude: 51.0, longitude: 21.0, on_demand: true)

line1 = Line.create(name: "Line 1", type_of_vehicle: "Bus", low_floor: true)

LineStop.create(line: line1, stop: stop1, sequence: 1)
LineStop.create(line: line1, stop: stop2, sequence: 2)

Schedule.create(line: line1, stop: stop1, direction: "to City", time: "08:00")
Schedule.create(line: line1, stop: stop2, direction: "to City", time: "08:10")