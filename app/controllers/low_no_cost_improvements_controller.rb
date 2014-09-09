class LowNoCostImprovementsController < ApplicationController
  # GET /low_no_cost_improvements
  # GET /low_no_cost_improvements.xml
  def index
    @low_no_cost_improvements = LowNoCostImprovement.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @low_no_cost_improvements }
    end
  end

  # GET /low_no_cost_improvements/1
  # GET /low_no_cost_improvements/1.xml
  def show
    @low_no_cost_improvement = LowNoCostImprovement.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @low_no_cost_improvement }
    end
  end

  # GET /low_no_cost_improvements/new
  # GET /low_no_cost_improvements/new.xml
  def new
    @low_no_cost_improvement = LowNoCostImprovement.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @low_no_cost_improvement }
    end
  end

  # GET /low_no_cost_improvements/1/edit
  def edit
    @low_no_cost_improvement = LowNoCostImprovement.find(params[:id])
  end

  # POST /low_no_cost_improvements
  # POST /low_no_cost_improvements.xml
  def create
    @low_no_cost_improvement = LowNoCostImprovement.new(params[:low_no_cost_improvement])

    respond_to do |format|
      if @low_no_cost_improvement.save
        format.html { redirect_to(@low_no_cost_improvement, :notice => 'Low no cost improvement was successfully created.') }
        format.xml  { render :xml => @low_no_cost_improvement, :status => :created, :location => @low_no_cost_improvement }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @low_no_cost_improvement.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /low_no_cost_improvements/1
  # PUT /low_no_cost_improvements/1.xml
  def update
    @low_no_cost_improvement = LowNoCostImprovement.find(params[:id])

    respond_to do |format|
      if @low_no_cost_improvement.update_attributes(params[:low_no_cost_improvement])
        format.html { redirect_to(@low_no_cost_improvement, :notice => 'Low no cost improvement was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @low_no_cost_improvement.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /low_no_cost_improvements/1
  # DELETE /low_no_cost_improvements/1.xml
  def destroy
    @low_no_cost_improvement = LowNoCostImprovement.find(params[:id])
    @low_no_cost_improvement.destroy

    respond_to do |format|
      format.html { redirect_to(low_no_cost_improvements_url) }
      format.xml  { head :ok }
    end
  end
end
