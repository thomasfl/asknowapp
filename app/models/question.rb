class Question < ActiveRecord::Base
  belongs_to :user
  attr_accessor :email_recipients

  validates_presence_of :description, :on => :create
  validates_presence_of :user_id


  def generate_secret_key(len = 8)
    chars = ("a".."z").to_a + ("A".."Z").to_a + ("0".."9").to_a
    newpass = ""
    1.upto(len) { |i| newpass << chars[rand(chars.size)] }
    newpass
  end

  # We're only delivering questions by email for now
  def deliver_questions(recipients,question)
    recipients.split(/,/).each do |recipient|
      secret_key = generate_secret_key
      QuestionMailer.email_question(recipient, question, secret_key)

      answer = Answer.new(:secret_key => secret_key,
                          :recipient_email => recipient,
                          :question_id => question.id,
                          :guid => 1, # not used here, but is set to not null in db
                          :question_owner_id => 1) # not used here, but is set to not null in db
      answer.save
    end
  end

end
