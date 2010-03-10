class VoiceCallsController < ApplicationController
  # GET /voice_calls
  # GET /voice_calls.xml
  def index
    @voice_calls = VoiceCall.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @voice_calls }
    end
  end

  # GET /voice_calls/1
  # GET /voice_calls/1.xml
  def show
    @voice_call = VoiceCall.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @voice_call }
    end
  end

  # GET /voice_calls/new
  # GET /voice_calls/new.xml
  def new
    @voice_call = VoiceCall.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @voice_call }
    end
  end

  # GET /voice_calls/1/edit
  def edit
    @voice_call = VoiceCall.find(params[:id])
  end

  # POST /voice_calls
  # POST /voice_calls.xml
  def create
    @voice_call = VoiceCall.new(params[:voice_call])

    respond_to do |format|
      if @voice_call.save
        flash[:notice] = 'VoiceCall was successfully created.'
        format.html { redirect_to(user_voice_calls_path(current_user)) }
        format.xml  { render :xml => @voice_call, :status => :created, :location => @voice_call }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @voice_call.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /voice_calls/1
  # PUT /voice_calls/1.xml
  def update
    @voice_call = VoiceCall.find(params[:id])

    respond_to do |format|
      if @voice_call.update_attributes(params[:voice_call])
        flash[:notice] = 'VoiceCall was successfully updated.'
        format.html { redirect_to(user_voice_call(current_user,@voice_call)) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @voice_call.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /voice_calls/1
  # DELETE /voice_calls/1.xml
  def destroy
    @voice_call = VoiceCall.find(params[:id])
    @voice_call.destroy

    respond_to do |format|
      format.html { redirect_to(user_voice_calls_url(current_user)) }
      format.xml  { head :ok }
    end
  end
end