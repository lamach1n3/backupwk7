require 'pg'
namespace :dbr do

  desc "Import data from Quote Table to Fact Quote Table"
  task quotes: :environment do
    dwh = PG::Connection.new(host: 'localhost', port: 5432, dbname: "MaximeAuger_psql", user: "postgres", password: "postgres")
    puts "lead table to fact_quote table"
    
    dwh.exec("TRUNCATE fact_quotes")

    dwh.prepare('to_fact_quotes', 'INSERT INTO fact_quotes (quote_id, creation, company_name, email, nb_elevator, created_at, updated_at) VALUES ($1, $2, $3, $4, $5, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP)')
    Quote.all.each do |quotes|
      dwh.exec_prepared('to_fact_quotes', [quotes.id, quotes.created_at, quotes.quotes_company_name, quotes.quotes_email, quotes.elevator_amount])
    end
  end

  desc "Import data from Lead Table to Fact Contacts Table"
  task contacts: :environment do
    dwh = PG::Connection.new(host: 'localhost', port: 5432, dbname: "MaximeAuger_psql", user: "postgres", password: "postgres")
    puts "lead table to fact_contact table"
    
    dwh.exec("TRUNCATE fact_contacts")

    dwh.prepare('to_fact_contacts', 'INSERT INTO fact_contacts (contact_id, creation_date, company_name, email, project_name, created_at, updated_at) VALUES ($1, $2, $3, $4, $5, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP)')
    Lead.all.each do |ldcontact|
      dwh.exec_prepared('to_fact_contacts', [ldcontact.id, ldcontact.created_at, ldcontact.company_name, ldcontact.email, ldcontact.project_name])
    end
  end


  # desc "Import data from product"
  # task :elevators do
  #   dwh = PG::Connection.new(host: 'localhost', port: 5432, dbname: "MaximeAuger_psql", user: "postgres", password: "postgres")

  #   dwh.exec("TRUNCATE fact_elevators")

  #   dwh.prepare('to_fact_elevators', 'INSERT INTO fact_elevators (serial_number, date_commissioning, building_id, customer_id, building_city, created_at, updated_at) VALUES ($1, $2, $3, $4, $5, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP)')
  #   Customer.all.each do |customer|          
  #     customer.buildings.each do |building|
  #       building.batteries.each do |battery|
  #         battery.columns.each do |column|
  #           column.elevators.each do |elevator|
  #             dwh.exec_prepared('to_fact_elevators', [elevator.serial_number, elevator.date_commissioning, battery.building_id, battery.customer_id, building.address.city])
  #           end
  #         end
  #       end
  #     end
  #   end
  # end

  
  # desc "Import data from customers"
  # task :customers do
  #   dwh = PG::Connection.new(host: 'localhost', port: 5432, dbname: "MaximeAuger_psql", user: "postgres", password: "postgres")

  #   dwh.exec("TRUNCATE dim_customers")



end 

