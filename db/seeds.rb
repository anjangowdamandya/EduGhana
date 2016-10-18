# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.find_or_create_by(email:"admin@yopmail.com") do |u|
  u.password = 'admin123'
  u.user_name = 'admin'
  u.first_name = 'admin'
  u.last_name = 'admin'
  u.user_type = 'admin'
end
#Create Report types
ReportType.destroy_all
ReportType.create(name:'Exam Wise Report')
ReportType.create(name:'Subject Wise Report')
ReportType.create(name:'Grouped Exam Report', description:'Grouped exam report is where we get to know the reports of each batch, showing the total score of the student’s, their positions etc. To enable printing reports a possibility')
ReportType.create(name:'All batch report', description:'Pulling all batch report arranging them from first position to the last')
ReportType.create(name:'Consolidated report')
ReportType.create(name:'Archived Exam Report')
ReportType.create(name:'Grading Report')
ReportType.create(name:'Transcript Report')
ReportType.create(name:'Overall Student Ranking per batch per Year')
ReportType.create(name:'Student Ranking per Attendance')
ReportType.create(name:'Generates reports for Batch wise Student Rank per Attendance')