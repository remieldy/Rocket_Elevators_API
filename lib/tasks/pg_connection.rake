require 'pg'
namespace :export do

    desc "export to postgresql"
    task datawarehouse: :environment do
    
        conn = PG::Connection.open(host: "codeboxx-postgresql.cq6zrczewpu2.us-east-1.rds.amazonaws.com", port: 5432, dbname: "marc_antoine_tanguay", user: "codeboxx", password: "Codeboxx1!")

        conn.exec ("TRUNCATE factquotes RESTART IDENTITY")
        Quote.all.each do |quote|
            conn.exec("INSERT INTO \"factquotes\" (quote_id, creation_date, business_name, email, no_of_elevators) 
            VALUES (#{quote.id}, '#{quote.created_at}', '#{quote.company_name}', '#{quote.email}', #{quote.number_of_elevators})")          
        end

        conn.exec ("TRUNCATE factcontact RESTART IDENTITY")
        Lead.all.each do |lead|
            conn.exec("INSERT INTO \"factcontact\" (contact_id, date_of_creation, business_name, email, project_name) 
            VALUES (#{lead.id}, '#{lead.created_at}', '#{lead.company_name}', '#{lead.email}', '#{lead.project_name}')")
        end

        conn.exec ("TRUNCATE factelevator RESTART IDENTITY")
        Elevator.all.each do |elevator|
            conn.exec("INSERT INTO \"factelevator\" (elevator_id, serial_no, date_of_init, building_id, customer_id, city) 
            VALUES (#{elevator.id}, '#{elevator.serial_number}', '#{elevator.date_of_instal}', '#{elevator.column.battery.building_id}', #{elevator.column.battery.building.customer_id}, '#{elevator.column.battery.building.address.city}')")
        end

        conn.exec("TRUNCATE dimcustomers RESTART IDENTITY")
        Customer.all.each do |customer|
            no_elevators = 0
            customer.buildings.all.each do |building|
                building.batteries.all.each do |battery|
                    battery.columns.all.each do |column|
                        no_elevators += column.elevators.count
                    end
                end
            end
                        sql = ("INSERT INTO \"dimcustomers\" (date_of_creation, company_name, full_name_contact_person, contact_email, number_of_elevators, city) 
                        VALUES ('#{customer.date_of_creation}', '#{customer.company_name}', '#{customer.full_name_contact_person}', '#{customer.email_contact_person}', #{no_elevators}, '#{customer.address.city}')")
                        conn.exec(sql)
        end
    end
end