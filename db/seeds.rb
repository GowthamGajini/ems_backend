# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Employee.create({
  "employee_id": "E123",
  "firstname": "Gowtham",
  "lastname": "Nadula",
  "email": "gowtham@email.com",
  "phone_number": "1234567890",
  "date_of_joining": "2023-04-01",
  "salary": 300000
})