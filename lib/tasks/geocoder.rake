require 'geocoder'
desc "export to postgresql"
    task google: :environment do

        @markers = []
	
		Building.all.each do |building|
			address = building.address
			customer = building.customer.company_name 
			battery = building.batteries.count
			battery_ids = building.battery_ids
			columns = Column.where(battery_id: battery_ids).count
			column_ids = Column.where(battery_id: building.battery_ids).ids
			elevators = Elevator.where(column_id: column_ids).count
			contact = building.customer.full_name_service_person

		coordinates = [address.number_street, address.city, address.country].join(', ')
		full_coord = Geocoder.search(coordinates)
		lat = full_coord.first.latitude
        long = full_coord.first.longitude

        @markers << {lat: lat, lng: long,
               batteries: battery,
               columns: columns,
               name: customer,
               elevators: elevators,
               tech_name: contact,
               address: address
            }
            
        end
        puts @markers

	end


