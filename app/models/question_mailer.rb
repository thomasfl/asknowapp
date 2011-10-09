# -*- coding: utf-8 -*-
class QuestionMailer < ActionMailer::Base

  ActionMailer::Base.smtp_settings = {
    :address => 'smtp.gmail.com',
    :port => 587,
    :tls => true,
    :domain => 'mail.google.com',  # mail.customdomain.com if you use google apps
    :authentication => :plain,
    :user_name => 'asknowmail@gmail.com',  # make sure you include the full email address
    :password => 'AskNow4Me'

#     :tls => true,
#     :address => "smtp.gmail.com",
#     :port => "587",
#     :domain => "YOURDOMAIN",
#     :authentication => :plain,
#     :user_name => "GOOGLEUSERNAME",
#     :password => "GOOGLEPASSWORD"
  }

  # require 'tlsmail'

#   Net::SMTP.enable_tls(OpenSSL::SSL::VERIFY_NONE)
#   #ActionMailer::Base.raise_delivery_errors = true
#   #ActionMailer::Base.perform_deliveries = true
#   ActionMailer::Base.delivery_method = :smtp
#   # ActionMailer::Base.default_content_type = "text/html"
#   ActionMailer::Base.smtp_settings = {
#     :address => 'smtp.gmail.com',
#     :port => 587,
#     :tls => true,
#     :domain => 'mail.google.com',  # mail.customdomain.com if you use google apps
#     :authentication => :plain,
#     :user_name => 'asknowmail@gmail.com',  # make sure you include the full email address
#     :password => 'AskNow4Me'
#   }

  def spikemail()
    recipients    "thomasfl@usit.uio.no"
    subject       "Mer spike overskrift 2"
    sent_on       Time.now
    body          "This is the body sendt from rails"
  end

  def deliver_html_email(options)
    recipients    options[:recipient]
    subject       options[:subject]
    sent_on       Time.now
    body          options[:body]
  end

end
