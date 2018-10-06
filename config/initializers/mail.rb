Mail.defaults do
  delivery_method :smtp, address: "smtp.sendgrid.net", port: 587, domain: "https://studentloans.herokuapp.com", authentication: :plain, :user_name => ENV["USERNAME"], :password => ENV["PASSWORD"]
end
