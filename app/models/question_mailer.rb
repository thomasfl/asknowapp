# -*- coding: utf-8 -*-
class QuestionMailer < ActionMailer::Base

  ActionMailer::Base.smtp_settings = {
    :address => 'smtp.gmail.com',
    :enable_starttls_auto => true,
    :port => 587,
    :domain => 'mail.google.com',  # mail.customdomain.com if you use google apps
    :authentication => :plain,
    :user_name => 'asknowmail@gmail.com',  # make sure you include the full email address
    :password => 'AskNow4Me'
  }

  def deliver_html_email(options)
    recipients    options[:recipient]
    subject       options[:subject]
    sent_on       Time.now
    body          options[:body]
  end


end
