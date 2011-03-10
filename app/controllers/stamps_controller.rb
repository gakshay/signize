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

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @stamp }
    end
  end

  # GET /stamps/new
  # GET /stamps/new.xml
  def new
    @stamp = current_user.stamps.new

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
    @stamp = current_user.stamps.new(params[:stamp])

    respond_to do |format|
      if @stamp.save
        @settings = StampSetting.create(:stamp_id => @stamp.id, :settings => JSON.parse(params[:settings].to_json))
        format.html { redirect_to(@stamp, :notice => 'Stamp was successfully created.') }
        format.xml  { render :xml => @stamp, :status => :created, :location => @stamp }
      else
        format.html { render :action => "new" }
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
