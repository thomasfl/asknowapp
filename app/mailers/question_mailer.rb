class QuestionMailer < ActionMailer::Base
  default from: "from@example.com"


ActionMailer::Base.smtp_settings = {
  :address        => 'smtp.sendgrid.net',
  :port           => '587',
  :authentication => :plain,
  :user_name      => ENV['SENDGRID_USERNAME'],
  :password       => ENV['SENDGRID_PASSWORD'],
  :domain         => 'heroku.com'
}
ActionMailer::Base.delivery_method = :smtp

  def ask
    mail(:to => 'thomas.flemming@gmail.com', :subject => "Welcome to My Awesome Site")
  end

end
