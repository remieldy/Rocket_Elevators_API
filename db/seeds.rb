# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'csv'

csv_text = File.read(Rails.root.join('good_data', 'Address.csv'))
csv = CSV.parse(csv_text, col_sep: ",", :headers => true)
csv.each do |row|
    
    row = row.to_hash
    p row
    t = Address.new
    t.address_type = row['address_type']
    t.status = row['status']
    t.entity = row['entity']
    t.number_street = row['number_street']
    t.apt_number = row['apt_number']
    t.city = row['city']
    t.postal_code = row['postal_code']
    t.country = row['country']
    t.notes = row['notes']
    t.save!

end

csv_text = File.read(Rails.root.join('good_data', 'User.csv'))
csv = CSV.parse(csv_text, col_sep: ",", :headers => true)
csv.each do |row|
    
    row = row.to_hash
    p row
    t = User.new
    t.first_name = row['first_name']
    t.last_name = row['last_name']
    t.title = row['title']
    t.email = row['email']
    t.encrypted_password = row['encrypted_password']
    t.save!

end

csv_text = File.read(Rails.root.join('good_data', 'customer.csv'))
csv = CSV.parse(csv_text, col_sep: ",", :headers => true)
csv.each do |row|
    
    row = row.to_hash
    p row
    t = Customer.new
    t.address_id = row['address_id']
    t.user_id = row['user_id']
    t.date_of_creation = row['date_of_creation']
    t.company_name = row['company_name']
    t.full_name_contact_person = row['full_name_contact_person']
    t.phone_number_contact_person = row['phone_number_contact_person']
    t.email_contact_person = row['email_contact_person']
    t.company_description = row['company_description']
    t.full_name_service_person = row['full_name_service_person']
    t.phone_number_service_person = row['phone_number_service_person']
    t.email_service_person = row['email_service_person']
    # t.token= row['token']
    t.save!

end

csv_text = File.read(Rails.root.join('good_data', 'buildings.csv'))
csv = CSV.parse(csv_text, col_sep: ",", :headers => true)
csv.each do |row|
    
    row = row.to_hash
    p row
    t = Building.new
    t.address_id = row['address_id']
    t.customer_id = row['customer_id']
    t.full_name_admin_person = row['full_name_admin_person']
    t.email_admin_person = row['email_admin_person']
    t.phone_number_admin_person = row['phone_number_admin_person']
    t.full_name_tech_person = row['full_name_tech_person']
    t.email_tech_person = row['email_tech_person']
    t.phone_number_tech_person = row['phone_number_tech_person']
    t.save!

end

csv_text = File.read(Rails.root.join('good_data', 'Building Details.csv'))
csv = CSV.parse(csv_text, col_sep: ",", :headers => true)
csv.each do |row|
    
    row = row.to_hash
    p row
    t = Buildingdetail.new
    t.building_id = row['building_id']
    t.information = row['information']
    t.valeur = row['valeur']
    t.save!

end


csv_text = File.read(Rails.root.join('good_data', 'Batteries.csv'))
csv = CSV.parse(csv_text, col_sep: ",", :headers => true)
csv.each do |row|
    
    row = row.to_hash
    p row
    t = Battery.new
    t.building_id = row['building_id']
    t.user_id = row['user_id']
    t.building_type = row['building_type']
    t.status = row['status']
    t.date_of_install = row['date_of_install']
    t.date_of_inspect = row['date_of_inspect']
    t.inspect_certificate = row['inspect_certificate']
    t.information = row['information']
    t.notes = row['notes']
    t.save!

end

csv_text = File.read(Rails.root.join('good_data', 'Columns.csv'))
csv = CSV.parse(csv_text, col_sep: ",", :headers => true)
csv.each do |row|
    
    row = row.to_hash
    p row
    t = Column.new
    t.battery_id = row['battery_id']
    t.building_type = row['building_type']
    t.number_of_floors = row['number_of_floors']
    t.status = row['status']
    t.information = row['information']
    t.notes = row['notes']
    t.save!

end

csv_text = File.read(Rails.root.join('good_data', 'Elevators.csv'))
csv = CSV.parse(csv_text, col_sep: ",", :headers => true)
csv.each do |row|
    
    row = row.to_hash
    p row
    t = Elevator.new
    t.column_id = row['column_id']
    t.serial_number = row['serial_number']
    t.model_type = row['model_type']
    t.building_type = row['building_type']
    t.status = row['status']
    t.date_of_install = row['date_of_install']
    t.date_of_inspect = row['date_of_inspect']
    t.inspect_certificate = row['inspect_certificate']
    t.information = row['information']
    t.notes = row['notes']
    t.save!

end

csv_text = File.read(Rails.root.join('good_data', 'Quotes.csv'))
csv = CSV.parse(csv_text, col_sep: ",", :headers => true)
csv.each do |row|
    
    row = row.to_hash
    p row

    t = Quote.new
    t.department = row['department']
    t.full_name = row['full_name']
    t.company_name = row['company_name']
    t.email = row['email']
    t.phone_number = row['phone_number']
    t.number_of_apartments = row['number_of_apartments']
    t.number_of_floors = row['number_of_floors']
    t.number_of_basements = row['number_of_parking']
    t.number_of_stores = row['number_of_stores']
    t.max_occupancy_per_floor = row['max_occupancy_per_floor']
    t.hours_of_activity = row['hours_of_activity']
    t.service_level = row['service_level']
    t.number_of_elevators = row['number_of_elevators']
    t.installation_cost = row['installation_cost']
    t.total_cost = row['total_cost']
    t.save!

end

 csv_text = File.read(Rails.root.join('good_data', 'leads.csv'))
 csv = CSV.parse(csv_text, col_sep: ",", :headers => true)
 csv.each do |row|
    
    row = row.to_hash
    p row
    t = Lead.new
    t.customer_id = row['customer_id']
    t.full_name = row['full_name']
    t.company_name = row['company_name']
    t.email = row['email']
    t.phone_number = row['phone_number']
    t.project_name = row['project_name']
    t.project_description = row['project_description']
    t.department_in_charge = row['department_in_charge']
    t.message = row['message']
    t.attachment = row['attachment']
    t.save!

end

csv_text = File.read(Rails.root.join('good_data', 'intervention.csv'))
csv = CSV.parse(csv_text, col_sep: ",", :headers => true)
csv.each do |row|
   
   row = row.to_hash
   p row
   t = Intervention.new
   t.user_id = row['user_id']
   t.building_id = row['building_id']
   t.battery_id = row['battery_id']
   t.column_id = row['column_id']
   t.elevator_id = row['elevator_id']
   t.intervention_start = row['intervention_start']
   t.intervention_finish = row['intervention_finish']
   t.intervention_result = row['intervention_result']
   t.report = row['report']
   t.status = row['status']
   t.save!

end


