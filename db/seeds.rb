# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)



Employee.create(first_name:"Nicolas", last_name:"genest", function:"CEO", phone:"roc-kets", email:"nicolas.genest@codeboxx.biz" )
Employee.create(first_name:"Nadya", last_name:"Fortier", function:"Director", phone:"roc-kets", email:"nadya.fortier@codeboxx.biz" )
Employee.create(first_name:"Martin", last_name:"chantal", function:"Director Assistant", phone:"roc-kets", email:"martin.chantal@codeboxx.biz" )
Employee.create(first_name:"Mathieu", last_name:"Houde", function:"Captain", phone:"roc-kets", email:"mathieu.houde@codeboxx.biz" )
Employee.create(first_name:"David", last_name:"Boutin", function:"Engineer", phone:"roc-kets", email:"david.boutin@codeboxx.biz" )
Employee.create(first_name:"Mathieu", last_name:"Lortie", function:"Engineer", phone:"roc-kets", email:"mathieu.lortiet@codeboxx.biz" )
Employee.create(first_name:"Thomas", last_name:"Carrier", function:"Engineer", phone:"roc-kets", email:"thomas.carriert@codeboxx.biz" )



# 
# def employee
    # nicolas = ['nicolas.genest@codeboxx.biz','nicolas','Genest','Nicolas','CEO']
    # nadya = ['nadya.fortier@codeboxx.biz','nadya1','Fortier','Nadya','Director']
    # martin = ['martin.chantal@codeboxx.biz','martin','Chantal','Martin','Director Assistant']
    # mathieuH = ['mathieu.houde@codeboxx.biz','mathieu','Houde','Mathieu','Captain']
    # david = ['david.boutin@codeboxx.biz','david1','Boutin','David','Engineer']
    # mathieuL = ['mathieu.lortie@codeboxx.biz','mathieu','Lortie','Mathieu','Engineer']
    # thomas = ['thomas.carrier@codeboxx.biz','thomas','Carrier','Thomas','Engineer']
    # 
    # list_ = [nicolas, nadya, martin, mathieuH, david, mathieuL, thomas]
    # 
    # for user in list_ do
        # user_ = User.new
        # user_.email = user[0]
        # user_.password = user[1]
        # user_.add_role :employee
        # employee = Employee.new
        # employee.last_name = user[2]
        # employee.first_name = user[3]
        # employee.function = user[4]
        # user_.employee = employee   
        # user_.save!
    # end
# end