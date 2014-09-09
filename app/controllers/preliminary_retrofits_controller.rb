require 'rubygems'
require 'gchart'
require 'time'

class PreliminaryRetrofitsController < ApplicationController
    # Edit the basic information of the building
  def edit
    begin 
      session_number= session['bldg_id'] 
      if session_number== nil
        building = nil
      else
        building = Building.where(:session_number=>session_number).first        
      end
    rescue
      building = nil
    end
    
    @preliminary_retrofit = nil
    if building != nil
      @preliminary_retrofit = building.preliminary_retrofit
    end
  end
  
  def update    
    if $CBES_SHOW >= $CBES_SHOW_STATEMENT
      endTime = Time.now()
      puts "Start to update Prelimieary Retrofit Controller."
    end
    @preliminary_retrofit = PreliminaryRetrofit.find(params[:id])
    @preliminary_retrofit.lightUpgradeID =params[:lightUpgradeID]
    @preliminary_retrofit.windowUpgradeID =params[:windowUpgradeID]
    @preliminary_retrofit.coolingUpgradeID =params[:coolingUpgradeID]
    @preliminary_retrofit.heatingUpgradeID= params[:heatingUpgradeID]    
    @preliminary_retrofit.resultOutOfDate= nil 
    
    # If can't be save, don't analyze
    if @preliminary_retrofit.save 
       if $CBES_SHOW >= $CBES_SHOW_STATEMENT
          startTime = endTime
          endTime = Time.now()
          puts "    Save the changes to database: " + '%.2f' % (endTime-startTime) + 's'
       end
      
      basicInformation = BasicInformationsController.to_API_Model(@preliminary_retrofit.basic_information)
      flatUtilityRate = FlatUtilityRatesController.to_API_Model(@preliminary_retrofit.flat_utility_rate)    
      investment = InvestmentsController.to_API_Model(@preliminary_retrofit.investment) 
      emission = EmissionsController.to_API_Model(@preliminary_retrofit.emission)
      
       preliminaryRetrofit = PreliminaryRetrofitsController.to_API_Model(@preliminary_retrofit)
       preliminaryRetrofit.run(basicInformation,flatUtilityRate,emission,investment)
       
       if $CBES_SHOW >= $CBES_SHOW_STATEMENT
          startTime = endTime
          endTime = Time.now()
          puts "    Call Preliminary Retrofit API: " + '%.2f' % (endTime-startTime) + 's'
       end
       
       if @preliminary_retrofit.baseline_result != nil
         @preliminary_retrofit.baseline_result.destroy
       end
          
         @preliminary_retrofit.suggested_retrofit_results.each do |obj|
           obj.destroy
         end
         
         @preliminary_retrofit.unsuggested_single_retrofit_results.each do |obj|
           obj.destroy
         end
         
         if $CBES_SHOW >= $CBES_SHOW_STATEMENT
            startTime = endTime
            endTime = Time.now()
            puts "    Clean old result: " + '%.2f' % (endTime-startTime) + 's'
         end
       
         @preliminary_retrofit.baseline_result = SimulationResultsController.from_API_Model(preliminaryRetrofit.baselineSimulationResult) 
         
         if $CBES_SHOW >= $CBES_SHOW_STATEMENT
            startTime = endTime
            endTime = Time.now()
            puts "        Create Baseline APP object: " + '%.2f' % (endTime-startTime) + 's'
         end     

        
        preliminaryRetrofit.suggestedRetrofitResultList.each do |retrofit|
          @preliminary_retrofit.suggested_retrofit_results.push(RetrofitResultsController.from_API_Model(retrofit))            
        end 
        
         if $CBES_SHOW >= $CBES_SHOW_STATEMENT
            startTime = endTime
            endTime = Time.now()
            puts "        Create Suggested APP object: " + '%.2f' % (endTime-startTime) + 's'
         end     
        
        preliminaryRetrofit.singleMeasureRetrofitResultList.each do |retrofit|
          @preliminary_retrofit.unsuggested_single_retrofit_results.push(RetrofitResultsController.from_API_Model(retrofit))            
        end     
        
         if $CBES_SHOW >= $CBES_SHOW_STATEMENT
            startTime = endTime
            endTime = Time.now()
            puts "        Create no-suggested APP object: " + '%.2f' % (endTime-startTime) + 's'
         end           
        
        fistECM= true 
        measureIDs= ""
        preliminaryRetrofit.usedMeasureList.each do |measure|
            if not fistECM 
              measureIDs += ";"                    
            else
                fistECM= false                          
            end
            measureIDs += measure.id.to_s
        end            
          
       @preliminary_retrofit.measureIDs= measureIDs
        
       if $CBES_SHOW >= $CBES_SHOW_STATEMENT
          startTime = endTime
          endTime = Time.now()
          puts "        Create Measure APP object: " + '%.2f' % (endTime-startTime) + 's'
       end    
       
       if $CBES_SHOW >= $CBES_SHOW_STATEMENT
          startTime = endTime
          endTime = Time.now()
          puts "    Create APP objects: " + '%.2f' % (endTime-startTime) + 's'
       end   
        
        @preliminary_retrofit.resultOutOfDate= false
        @preliminary_retrofit.save
        @preliminary_retrofit= PreliminaryRetrofit.find(params[:id])          
        
       if $CBES_SHOW >= $CBES_SHOW_STATEMENT
          startTime = endTime
          endTime = Time.now()
          puts "        Save Results: " + '%.2f' % (endTime-startTime) + 's'
       end
    end
    
    respond_to do |format|
        format.html {  render :action=>:edit }
    end
  end
   
  def self.to_API_Model(obj)      
      preliminaryRetrofit = CBES::PreliminaryRetrofit.new
      preliminaryRetrofit.lightUpgradeID= obj.lightUpgradeID
      preliminaryRetrofit.windowUpgradeID= obj.windowUpgradeID
      preliminaryRetrofit.coolingUpgradeID= obj.coolingUpgradeID
      preliminaryRetrofit.heatingUpgradeID= obj.heatingUpgradeID  
      return preliminaryRetrofit
  end
end
