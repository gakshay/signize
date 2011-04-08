class StampsController < ApplicationController
  # GET /stamps
  # GET /stamps.xml
  before_filter :authenticate_user!
  def index
    @stamps = current_user.stamps.all
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @stamps }
    end
  end

  # GET /stamps/1
  # GET /stamps/1.xml
  def show
    @stamp = current_user.stamps.find(params[:id])
    @css = @stamp.setting.settings
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @stamp }
      format.json { render :json => @stamp}
    end
  end

  # GET /stamps/new
  # GET /stamps/new.xml
  def new
    session[:sign_params] ||= {}
    @stamp = current_user.stamps.new(session[:sign_params])
    @stamp.current_step = session[:sign_step]
    @template_name = session[:sign_template]
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @stamp }
    end
  end

  # GET /stamps/1/edit
  def edit
    @stamp = current_user.stamps.find(params[:id])
  end

  # POST /stamps
  # POST /stamps.xml
  def create
    session[:sign_params].deep_merge!(params[:stamp]) if params[:stamp]
    session[:sign_template] = params[:stamp_template] if params[:stamp_template]
    @stamp = current_user.stamps.new(session[:sign_params])
    @stamp.current_step = session[:sign_step]
    @template_name = session[:sign_template]
    
    if @stamp.valid?
      if params[:back_button]
        @stamp.previous_step
      elsif @stamp.last_step?
        @stamp.save #if @order.all_valid?
      else
        @stamp.next_step
      end
      session[:sign_step] = @stamp.current_step
    end
    respond_to do |format|
      unless @stamp.new_record?
        @settings = StampSetting.create(:stamp_id => @stamp.id, :settings => JSON.parse(params[:settings].to_json))
        session[:sign_step] = session[:sign_params] = nil
        format.html { redirect_to(@stamp, :notice => 'Stamp was successfully created.') }
        format.xml  { render :xml => @stamp, :status => :created, :location => @stamp }
      else
        format.html { redirect_to(:action => "new") }
        format.xml  { render :xml => @stamp.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /stamps/1
  # PUT /stamps/1.xml
  def update
    @stamp = current_user.stamps.find(params[:id])

    respond_to do |format|
      if @stamp.update_attributes(params[:stamp])
        @settings = @stamp.setting.update_attributes(:settings => JSON.parse(params[:settings].to_json))
        format.html { redirect_to(@stamp, :notice => 'Stamp was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @stamp.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /stamps/1
  # DELETE /stamps/1.xml
  def destroy
    @stamp = current_user.stamps.find(params[:id])
    @stamp.destroy

    respond_to do |format|
      format.html { redirect_to(stamps_url) }
      format.xml  { head :ok }
    end
  end
end
