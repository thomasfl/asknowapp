class QuestionMailer < ActionMailer::Base
  default from: "from@example.com"

  def ask
    mail(:to => 'thomas.flemming@gmail.com', :subject => "Welcome to My Awesome Site")
  end

end
