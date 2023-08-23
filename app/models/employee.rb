class Employee < ApplicationRecord
	validates :employee_id, :firstname, :lastname, :email, :phone_number, :date_of_joining, :salary, presence: true
	validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
	validates :firstname, :lastname, format: { with: /\A[a-zA-Z]+\z/, message: "can have only letters" }
	validates :employee_id, format: { with: /\A[a-zA-Z0-9]+\z/, message: "can have alphanumeric without spaces" }
    validates :phone_number, format: { with: /\A\d{10}\z/ }

    def yearly_salary
    	self.salary * 12
    end
end
