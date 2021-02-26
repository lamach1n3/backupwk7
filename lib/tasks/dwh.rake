# require 'pg'
# namespace :dwh do
#     task mysql: :environment do
#         mysqltest = ActiveRecord::Base.establish_connection(ActiveRecord::Base.configurations['development'])
#         puts mysqltest.connection.current_database
#     end
# end  

# require 'pg'
# namespace :dwh do
#     task mysql: :environment do
#         mysqltest = ActiveRecord::Base.establish_connection(:development)
#         puts mysqltest.connection.current_database
#     end
# # end  

# require 'pg'
# namespace :dwh do
#     task mysql: :environment do
#         mysqltest = ActiveRecord::Base.connection
#         puts mysqltest
#         dwh = DwhRecord.connection
#         puts dwh.current_database
#     end
# end  