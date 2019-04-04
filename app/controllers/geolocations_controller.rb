class GeolocationsController < ApplicationController
    before_action :authenticate_user!

    def index
        @markers = []
	
		Building.all.each do |building|
			address = building.address
			customer = building.customer.company_name 
			batteris = building.batteries.count
			battery_ids = building.battery_ids
			columns = Column.where(battery_id: battery_ids).count
			column_ids = Column.where(battery_id: building.battery_ids).ids
			elevators = Elevator.where(column_id: column_ids).count
            contact = building.customer.full_name_service_person

            building.batteries.all.each do |battery|
                floor = battery.columns.first.number_of_floors
            
        # find latitude/longitude 
		coordinates = [address.number_street, address.city, address.country].join(', ')
		full_coord = Geocoder.search(coordinates)
		lat = full_coord.first.latitude
        long = full_coord.first.longitude

        @markers << {lat: lat, lng: long,
               batteries: batteris,
               columns: columns,
               name: customer,
               elevators: elevators,
               tech_name: contact,
               address: address.display_address,
               floor_number: floor,
		}
            end
		end
    end

end