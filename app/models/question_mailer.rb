# -*- coding: utf-8 -*-
class QuestionMailer < ActionMailer::Base

  def deliver_html_email(options)
    recipients    options[:recipient]
    subject       options[:subject]
    sent_on       Time.now
    body          options[:body]
  end

end
