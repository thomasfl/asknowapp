# -*- coding: utf-8 -*-
class QuestionMailer < ActionMailer::Base

  ActionMailer::Base.smtp_settings = {
    :address        => 'smtp.sendgrid.net',
    :port           => '587',
    :authentication => :plain,
    :user_name      => ENV['SENDGRID_USERNAME'],
    :password       => ENV['SENDGRID_PASSWORD'],
    :domain         => 'heroku.com'
  }
  ActionMailer::Base.delivery_method = :smtp

  def deliver_html_email(options)
    recipients    options[:recipient]
    subject       options[:subject]
    sent_on       Time.now
    body          options[:body]
    mail(:to => options[:recipient], :subject => options[:subject], :body => options[:body])
  end


  Pony.options = {
    :via => :smtp,
    :via_options => {
      :address => 'smtp.sendgrid.net',
      :port => '587',
      :domain => 'heroku.com',
      :user_name => ENV['SENDGRID_USERNAME'],
      :password => ENV['SENDGRID_PASSWORD'],
      :authentication => :plain,
      :enable_starttls_auto => true
    }
  }

  def test_pony
    Pony.mail(:to => 'thomas.flemming@gmail.com', :from => 'me@example.com',
              :subject => 'hi', :body => 'Hello there.')
  end

end
