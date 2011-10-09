# -*- coding: utf-8 -*-
class QuestionMailer < ActionMailer::Base

  def deliver_html_email(options)
    recipients    options[:recipient]
    subject       options[:subject]
    sent_on       Time.now
    body          options[:body]
    headers["Content-Type"] = "text/html; charset=UTF-8"
  end

end
