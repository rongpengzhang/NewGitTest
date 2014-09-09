class DetailedRetrofitsController < ApplicationController
  # GET /detailed_retrofits
  # GET /detailed_retrofits.xml
  def index
    @detailed_retrofits = DetailedRetrofit.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @detailed_retrofits }
    end
  end

  # GET /detailed_retrofits/1
  # GET /detailed_retrofits/1.xml
  def show
    @detailed_retrofit = DetailedRetrofit.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @detailed_retrofit }
    end
  end

  # GET /detailed_retrofits/new
  # GET /detailed_retrofits/new.xml
  def new
    @detailed_retrofit = DetailedRetrofit.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @detailed_retrofit }
    end
  end

  # GET /detailed_retrofits/1/edit
  def edit
    @detailed_retrofit = DetailedRetrofit.find(params[:id])
  end

  # POST /detailed_retrofits
  # POST /detailed_retrofits.xml
  def create
    @detailed_retrofit = DetailedRetrofit.new(params[:detailed_retrofit])

    respond_to do |format|
      if @detailed_retrofit.save
        format.html { redirect_to(@detailed_retrofit, :notice => 'Detailed retrofit was successfully created.') }
        format.xml  { render :xml => @detailed_retrofit, :status => :created, :location => @detailed_retrofit }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @detailed_retrofit.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /detailed_retrofits/1
  # PUT /detailed_retrofits/1.xml
  def update
    @detailed_retrofit = DetailedRetrofit.find(params[:id])

    respond_to do |format|
      if @detailed_retrofit.update_attributes(params[:detailed_retrofit])
        format.html { redirect_to(@detailed_retrofit, :notice => 'Detailed retrofit was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @detailed_retrofit.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /detailed_retrofits/1
  # DELETE /detailed_retrofits/1.xml
  def destroy
    @detailed_retrofit = DetailedRetrofit.find(params[:id])
    @detailed_retrofit.destroy

    respond_to do |format|
      format.html { redirect_to(detailed_retrofits_url) }
      format.xml  { head :ok }
    end
  end
end
