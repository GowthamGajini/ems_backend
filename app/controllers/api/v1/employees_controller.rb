class Api::V1::EmployeesController < ApplicationController
	before_action :set_employee, only: :income_details

	def create
        employee = Employee.new(employee_params)

        if employee.save
          render json: { message: "Employee details saved successfully.", id: employee.id }, status: :created
        else
          render json: { errors: employee.errors.full_messages }, status: :unprocessable_entity
        end
    end

    def income_details
    	employee_tax_service = TaxService.new(@employee.salary, @employee.date_of_joining)
    	employee_tax, employee_cess = employee_tax_service.calculate_tax_and_cess
    	employee_salary_info = { 
    		total_salary: employee_tax_service.taxable_salary, 
    		tax_payable: employee_tax, 
    		cess_payable: employee_cess
    	}
    	render json: @employee.slice(:employee_id, :firstname, :lastname).merge(employee_salary_info)
    end

    private

    def employee_params
        params.require(:employee).permit(:employee_id, :firstname, :lastname, :email, :phone_number, :date_of_joining, :salary)
    end

    def set_employee
    	@employee = Employee.find(params[:id])
    rescue ActiveRecord::RecordNotFound
        render json: { error: 'Employee not found' }, status: :not_found
    end
end
