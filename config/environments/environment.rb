TAIMAFRICA::Application.configure do
  config.action_mailer.delivery_method = :smtp
  config.action_mailer.raise_delivery_errors = true
end

ActionMailer::Base.smtp_settings = {
  :user_name => '',
  :password => 'your_sendgrid_api_key',
  :domain => 'yourdomain.com',
  :address => 'smtp.sendgrid.net',
  :port => 587,
  :authentication => :plain,
  :enable_starttls_auto => true
}