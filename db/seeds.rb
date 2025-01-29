# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# Create Company Data
company1 = Company.create!(company_name: "AFAB", company_address: "Mariveles, Bataan", company_email: "info@afab.ph")

# Create Position Data
position1 = Position.create!(position_title: "MIS Programmer", salary: 25000)
position2 = Position.create!(position_title: "MIS Analyst", salary: 50000)

# Create Employee Data
# employee1 = Employee.create!(EmpNo: 1, FirstName: "Zahir", LastName: "Miranda", MiddleName: "Arellano", company_id: company1.id, position_id: position1.id)
# employee2 = Employee.create!(EmpNo: 2, FirstName: "Jayla", LastName: "Delarosa", MiddleName: "Allison", company_id: company1.id, position_id: position2.id)
# employee3 = Employee.create!(EmpNo: 3, FirstName: "Jade", LastName: "Vance", MiddleName: "Lucero", company_id: company1.id, position_id: position1.id)
# employee4 = Employee.create!(EmpNo: 4, FirstName: "Margo", LastName: "Castillo", MiddleName: "Guevara", company_id: company1.id, position_id: position1.id)
# employee5 = Employee.create!(EmpNo: 5, FirstName: "Kyler", LastName: "Gutierrez", MiddleName: "Zamora", company_id: company1.id, position_id: position2.id)

employee1 = Employee.create!(employee_number: 1, first_name: "Zahir", last_name: "Miranda", middle_name: "Arellano", position: position1)
employee2 = Employee.create!(employee_number: 2, first_name: "Jayla", last_name: "Delarosa", middle_name: "Allison", position: position2)
employee3 = Employee.create!(employee_number: 3, first_name: "Jade", last_name: "Vance", middle_name: "Lucero", position: position1)
employee4 = Employee.create!(employee_number: 4, first_name: "Margo", last_name: "Castillo", middle_name: "Guevara", position: position1)
employee5 = Employee.create!(employee_number: 5, first_name: "Kyler", last_name: "Gutierrez", middle_name: "Zamora", position: position2)

# Create EmployeeCompany Data
employee_company_1 = EmployeeCompany.create!(employee: employee1, company: company1)
employee_company_2 = EmployeeCompany.create!(employee: employee2, company: company1)
employee_company_3 = EmployeeCompany.create!(employee: employee3, company: company1)
employee_company_4 = EmployeeCompany.create!(employee: employee4, company: company1)
employee_company_5 = EmployeeCompany.create!(employee: employee5, company: company1)

puts "Initial data created successfully"