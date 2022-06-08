ActionMailer::Base.smtp_settings = {
    user_name: "apikey",
    password: ENV['SENDGRID_PASSWORD'],
    domain: 'heroku.com',
    address: "smtp.sendgrid.net",
    port: 587,
    authentication: :plain,
    enable_starttls_auto: true
  }