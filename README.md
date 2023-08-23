# ems_backend
Employee Management System Backend

Please run bin/rails db:seed after db migration

# Create Employee Record

Request Method: POST

curl --location 'localhost:3000/api/v1/employees' \
--header 'Content-Type: application/json' \
--data-raw '{
    "employee_id": "E123"
, "firstname": "Gowtham"
, "lastname": "Nadula"
, "email": "gowtham@email.com"
, "phone_number": "1234567890"
, "date_of_joining": "2023-04-01"
, "salary": 300000 
}'

Request Params: 
{
  "employee_id": "E123",
  "firstname": "Gowtham",
  "lastname": "Nadula",
  "email": "gowtham@email.com",
  "phone_number": "1234567890",
  "date_of_joining": "2023-04-01",
  "salary": 300000
}

Response
{
    "message": "Employee details saved successfully.",
    "id": 1
}

# Get Employee Details

Request Method: GET

curl --location 'localhost:3000/api/v1/employees/1/income_details'

Request Params: 
{
}

Response
{
    "employee_id": "E123",
    "firstname": "Gowtham",
    "lastname": "Nadula",
    "total_salary": 3600000,
    "tax_payable": 682500.0,
    "cess_payable": 22000.0
}