RailsAdmin.config do |config|
  ### Popular gems integration
  config.authorize_with do
    
    if current_user
      puts "wssap"
      sync()
      redirect_to main_app.root_path unless current_user.admin == true
    else 
      redirect_to main_app.root_path
    end
  end
  pp "outside"
  
  def sync
    pp "inside"
      dwh = PG::Connection.new(host: 'localhost', port: 5432, dbname: "MaximeAuger_psql", user: "postgres", password: "postgres")
      dwh.exec("TRUNCATE fact_quotes")

      dwh.prepare('to_fact_quotes', 'INSERT INTO fact_quotes (quote_id, creation, company_name, email, nb_elevator, created_at, updated_at) VALUES ($1, $2, $3, $4, $5, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP)')
      Quote.all.each do |quotes|
      dwh.exec_prepared('to_fact_quotes', [quotes.id, quotes.created_at, quotes.quotes_company_name, quotes.quotes_email, quotes.elevator_amount])
      end
  
      dwh.exec("TRUNCATE fact_contacts")

      dwh.prepare('to_fact_contacts', 'INSERT INTO fact_contacts (contact_id, creation_date, company_name, email, project_name, created_at, updated_at) VALUES ($1, $2, $3, $4, $5, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP)')
      Lead.all.each do |ldcontact|
      dwh.exec_prepared('to_fact_contacts', [ldcontact.id, ldcontact.created_at, ldcontact.company_name, ldcontact.email, ldcontact.project_name])
      end

      dwh.exec("TRUNCATE fact_elevators")

      dwh.prepare('to_fact_elevators', 'INSERT INTO fact_elevators (serial_number, date_commissioning, building_id, customer_id, building_city, created_at, updated_at) VALUES ($1, $2, $3, $4, $5, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP)')
      Customer.all.each do |customer|    
      customer.buildings.each do |building|
          building.batteries.each do |battery|
          battery.columns.each do |column|
              column.elevators.each do |elevator|
              # puts building.address.city
              dwh.exec_prepared('to_fact_elevators', [elevator.serial_number, elevator.date_commissioning, battery.building_id, battery.building.customer_id, building.address.city])
              end
          end
          end
      end
      end
      
      dwh.exec("TRUNCATE dim_customers")

      dwh.prepare('to_dim_customers', 'INSERT INTO dim_customers (creation_date, company_name, fn_cpy_main_ct, email_cpy_main_ct, nb_elevators, customer_city, created_at, updated_at) VALUES ($1, $2, $3, $4, $5, $6, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP)')
      Customer.all.each do |customer|          
      nb_elevators = 0
      customer.buildings.each do |building|
          building.batteries.each do |battery|
          battery.columns.each do |column|
              column.elevators.each do |elevator|
              nb_elevators += 1
              end
          end
          end
      end
      
      dwh.exec_prepared('to_dim_customers', [customer.date_create, customer.company_name, customer.cpy_contact_full_name, customer.cpy_contact_email, nb_elevators, customer.address.city])
      end
  end
    # Sync Data Warehouse with official Database

  ## == Devise ==
  # config.authenticate_with do
  #   warden.authenticate! scope: :user
  # end
  # == Devise ==
  # config.authenticate_with do
  #   warden.authenticate! scope: :user
  # end
  # config.current_user_method(&:current_user)

  ## == CancanCan ==
  # config.authorize_with :cancancan

  ## == Pundit ==
  # config.authorize_with :pundit

  ## == PaperTrail ==
  # config.audit_with :paper_trail, 'User', 'PaperTrail::Version' # PaperTrail >= 3.0.0

  ### More at https://github.com/sferik/rails_admin/wiki/Base-configuration

  ## == Gravatar integration ==
  ## To disable Gravatar integration in Navigation Bar set to false
  # config.show_gravatar = true

  config.actions do
    dashboard                     # mandatory
    index                         # mandatory
    new
    export
    bulk_delete
    show
    edit
    delete
    show_in_app

    ## With an audit adapter, you can add:
    # history_index
    # history_show
  end

  config.navigation_static_links = {
    'Charts' => '/charts'
  }
end
