ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.smtp_settings = {  
  :address              => "smtp.gmail.com",  
  :port                 => 587,  
  :domain               => ENV['GMAIL_SMTP_DOMAIN'],  
  :user_name            => ENV['GMAIL_SMTP_USERNAME'],  
  :password             => ENV['GMAIL_SMTP_PASSWORD'],  
  :authentication       => "plain",  
  :enable_starttls_auto => true  
}  
