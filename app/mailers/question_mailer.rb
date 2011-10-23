class QuestionMailer < ActionMailer::Base
  default :from => "from@example.com"

    def email_question(recipient, question, secret_key)
    @question = question
    @secret_key = secret_key
    if Rails.env == 'production'
      base_url = "http://asknow.herokuapp.com/"
    else
      base_url = "http://localhost:3000/"
    end
    @yes_url = base_url + "yes/" + secret_key
    @no_url = base_url + "no/" + secret_key

    html_body = render_to_string "ask"

    if Rails.env == 'production'
      Pony.mail(:to => recipient,
                :from => 'AskNow <asknow@goasknow.com>',
                :subject => question.description,
                :html_body => html_body,
                :body => "In case you can't read html, Hello there.")
    else
      puts "DEBUG: delivering email:"
      puts html_body
    end

  end

end
