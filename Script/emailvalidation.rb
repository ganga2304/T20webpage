def validate_email?(email)
  email_regex = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
    email =~email_regex 
end
puts validate_email?("john.doe@domain.com") ? "Valid Email" : "Invalid Email"