require 'pg'
namespace :dwh do
    task mysql: :environment do
        mysqltest = ActiveRecord::Base.establish_connection(ActiveRecord::Base.configurations['development'])
        puts mysqltest.connection.current_database
    end
end  