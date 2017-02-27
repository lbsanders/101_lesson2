
# **************
#   PSEUDOCODE
# **************
#
# START
#
# GET loan amount
# VALIDATE it is a number
# SET principal = user input.to_f
#
# GET annual percentage rate
# VALIDATE it is a number
# SET annual_int_rate = user input.to_f / 100
#
# GET loan duration in years
# VALIDATE it is a number
# SET duration_yrs = user input.to_f
#
# SET monthly_int_rate = annual_int_rate / 12
# SET duration_months = duration_yrs * 12
#
# SET monthly_payment =
#   principal *
#     (monthly_int_rate *
#       (1 -
#         (1 + monthly_int_rate) ** -(duration_months)))
#
# PRINT "For a loan amount of #{principal} at #{annual_int_rate}%
#   over #{duration_yrs} years,
#   your payment each month would be #{monthly_payment}."
#
# END
#
# **************

def pos_number?(n)
  (n.match(/\d/) && n.match(/^\d*\.?\d*$/)) && n.to_f > 0
end

def prompt(message)
  Kernel.puts(">>> #{message}")
end

def invalid_number
  prompt("Your entry must be a positive number. Please try again.")
end

def blankline()                                                     # BETTER WAY?
  puts('')
end

blankline()
prompt("Welcome to the Loan Payment Calculator.")

principal = ''
loop do
  prompt("What is the amount to be borrowed?")
  principal = gets().chomp()
  if pos_number?(principal)
    break
  else
    invalid_number()
  end
end

annual_int_rate = ''
loop do
  prompt("What is the annual percentage rate on the loan?")
  annual_int_rate = gets().chomp()
  if pos_number?(annual_int_rate)
    break
  else
    invalid_number()
  end
end

duration_yrs = ''
loop do
  prompt("How many years will you take to repay it?")
  duration_yrs = gets().chomp()
  if pos_number?(duration_yrs)
    break
  else
    invalid_number()
  end
end

monthly_int_rate = annual_int_rate.to_f / 1200
duration_months = duration_yrs.to_f * 12

monthly_payment = principal.to_f *
                  (monthly_int_rate /
                  (1 - ((1 + monthly_int_rate)**-duration_months))) # CHECK FORMULA

monthly_payment = monthly_payment.round(2)

prompt("For a loan amount of $#{principal} at #{annual_int_rate}%   
over #{duration_yrs} years,")                                       # REFORMAT
prompt("your payment each month would be $#{monthly_payment}.")
blankline()
prompt("Thank you for using the Loan Payment Calculator.")
blankline()
