class Question < ActiveRecord::Base
  belongs_to :user
  attr_accessor :email_recipients

  validates_presence_of :description, :on => :create
  validates_presence_of :user_id

  def deliver_questions
    puts "Delivering email to: " + @email_recipients
    QuestionMailer.deliver_html_email(:recipient => "thomasfl@usit.uio.no",
                                      :subject => "Question goes here",
                                      :body => "<html><body><h1>AskNow</h1>Question goes here.</body></html>")
  end

end
