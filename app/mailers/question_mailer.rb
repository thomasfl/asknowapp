class QuestionMailer < ActionMailer::Base
  default from: "from@example.com"

  def ask_not_working
    mail(:to => 'thomas.flemming@gmail.com', :subject => "Welcome to My Awesome Site")
  end

  def ask
    Pony.mail(:to => 'thomas.flemming@gmail.com', :subject => "Welcome from pony",
              :html_body => '<h1>Hello there!</h1>', :body => "In case you can't read html, Hello there.")
  end

end
