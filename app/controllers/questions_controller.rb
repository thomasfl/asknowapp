class QuestionsController < ApplicationController

  before_filter :require_login

  # GET /questions
  # GET /questions.json
  def index
    @questions = Question.find(:all,
                               :conditions => ["user_id = ?", current_user.id],
                               :order => "created_at ASC")
    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @questions }
    end
  end

  # GET /questions/1
  # GET /questions/1.json
  def show
    @question = Question.find(:first, :conditions => ["id = ? and user_id = ? ", params[:id], current_user.id] )

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @question }
    end
  end

  # GET /questions/new
  # GET /questions/new.json
  def new
    @question = Question.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @question }
    end
  end

  # GET /questions/1/edit
  def edit
    @question = Question.find(:first,
                              :conditions => ["id = ? and user_id = ? ", params[:id], current_user.id] )
  end

  # POST /questions
  # POST /questions.json
  def create
    @question = Question.new(params[:question])
    @question.user_id = current_user.id
    recipients = params[:question][:email_recipients]
    ask_now = params[:commit][/^Go/]

    respond_to do |format|
      if @question.save
        @question.deliver_questions(recipients, @question)

        format.html { redirect_to @question, :notice => 'Question was successfully created.' }
        format.json { render :json => @question, :status => :created, :location => @question }
      else
        format.html { render :action => "new" }
        format.json { render :json => @question.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /questions/1
  # PUT /questions/1.json
  def update
    @question = Question.find(:first, :conditions => ["id = ? and user_id = ? ", params[:id], current_user.id] )
    recipients = params[:question][:email_recipients]

    respond_to do |format|
      if @question.update_attributes(params[:question])

        # binding.pry
        @question.deliver_questions(recipients, @question)

        format.html { redirect_to @question, :notice => 'Question was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @question.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /questions/1
  # DELETE /questions/1.json
  def destroy
    @question = Question.find(:first, :conditions => ["id = ? and user_id = ? ", params[:id], current_user.id] )
    @question.destroy

    respond_to do |format|
      format.html { redirect_to questions_url }
      format.json { head :ok }
    end
  end

end
