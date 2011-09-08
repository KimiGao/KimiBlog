ActionMailer::Base.smtp_settings = {
  :address              => "smtp.gmail.com",
  :post                 => 587,
  :domain               => "kimigao.me",
  :user_name            => "kimigao1986@gmail.com",
  :password             => "gaoshengyang",
  :authentication       => 'plain',
  :enable_starttls_auto => true 
}