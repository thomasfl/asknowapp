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

  ActionMailer::Base.raise_delivery_errors = false
  ActionMailer::Base.perform_deliveries = true
  ActionMailer::Base.delivery_method = :smtp
  # ActionMailer::Base.default_content_type = "text/html"

  def deliver_html_email(options)
    recipients    options[:recipient]
    subject       options[:subject]
    sent_on       Time.now
    body          options[:body]
    # headers["Content-Type"] = "text/html; charset=UTF-8"
  end

end
