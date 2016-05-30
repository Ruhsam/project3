# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Appointment.create(date: '06/06/2016', time: 1100, reason_for_visit: 'elbow hurts')
Appointment.create(date: '07/06/2016', time: 1100, reason_for_visit: 'knee hurts')
User.create(first_name:'john', last_name:'ruhsam',phone_number:'1234567890', email:'ruhsam@gmail.com', password:'thisthis')
