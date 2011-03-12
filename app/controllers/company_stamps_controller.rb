class CompanyStampsController < ApplicationController
  # GET /company_stamps
  # GET /company_stamps.xml
  def index
    @company_stamps = CompanyStamp.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @company_stamps }
    end
  end

  # GET /company_stamps/1
  # GET /company_stamps/1.xml
  def show
    @company_stamp = CompanyStamp.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @company_stamp }
    end
  end

  # GET /company_stamps/new
  # GET /company_stamps/new.xml
  def new
    @company_stamp = CompanyStamp.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @company_stamp }
    end
  end

  # GET /company_stamps/1/edit
  def edit
    @company_stamp = CompanyStamp.find(params[:id])
  end

  # POST /company_stamps
  # POST /company_stamps.xml
  def create
    @company_stamp = CompanyStamp.new(params[:company_stamp])

    respond_to do |format|
      if @company_stamp.save
        format.html { redirect_to(@company_stamp, :notice => 'Company stamp was successfully created.') }
        format.xml  { render :xml => @company_stamp, :status => :created, :location => @company_stamp }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @company_stamp.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /company_stamps/1
  # PUT /company_stamps/1.xml
  def update
    @company_stamp = CompanyStamp.find(params[:id])

    respond_to do |format|
      if @company_stamp.update_attributes(params[:company_stamp])
        format.html { redirect_to(@company_stamp, :notice => 'Company stamp was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @company_stamp.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /company_stamps/1
  # DELETE /company_stamps/1.xml
  def destroy
    @company_stamp = CompanyStamp.find(params[:id])
    @company_stamp.destroy

    respond_to do |format|
      format.html { redirect_to(company_stamps_url) }
      format.xml  { head :ok }
    end
  end
end
