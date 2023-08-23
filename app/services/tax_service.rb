class TaxService
  def initialize(monthly_salary, doj)
    @monthly_salary = monthly_salary
    @doj = doj
  end

  def calculate_tax_and_cess
    fy_income = taxable_salary
    return calculate_tax(fy_income), calculate_cess(fy_income)
  end

  def taxable_salary
    current_year = Date.today.year
    fy_start_date, fy_end_date  = Date.today.month > 3 ? ["#{current_year}-04-01".to_date, "#{current_year + 1}-03-31".to_date] : ["#{current_year - 1}-04-01".to_date, "#{current_year}-03-31".to_date]
    if @doj < fy_start_date
      return @monthly_salary * 12
    else
      joining_month_lop = (@doj.end_of_month.day - ((@doj.end_of_month - @doj).to_i + 1 ) ) * (@monthly_salary.to_f/30)
      joining_month_salary = @monthly_salary - joining_month_lop
      months_completly_payable = (@doj.month) > 3 ? 12 - (@doj.month - 3) : 3 - (@doj.month)
      return joining_month_salary.round + months_completly_payable *  @monthly_salary
    end
  end

  private
  def calculate_tax total_salary
    case total_salary
    when 0..250000
      0
    when 250000..500000
      (total_salary - 250000) * 0.05
    when 500000..1000000
      (total_salary - 500000) * 0.1 + 12500
    else
      (total_salary - 500000) * 0.2 + 50000 + 12500
    end
  end

  def calculate_cess total_salary
    if total_salary > 2500000
      (total_salary - 2500000 ) * 0.02
    else
      0
    end
  end
end
