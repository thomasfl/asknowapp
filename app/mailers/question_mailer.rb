class QuestionMailer < ActionMailer::Base
  default from: "from@example.com"

  def ask
    html_body = render_to_string "ask"
    Pony.mail(:to => 'thomas.flemming@gmail.com',
              :from => 'asknow@goasknow.com',
              :subject => "Welcome from pony",
              :html_body => html_body,
              :body => "In case you can't read html, Hello there.")
  end

  # This is the standard method of doing email, but I haven't got it working. -TF
  def ask_standard
    mail(:to => 'thomas.flemming@gmail.com',
         :from => 'asknow@goasknow.com',
         :subject => "Welcome to My Awesome Site")

  end

end
