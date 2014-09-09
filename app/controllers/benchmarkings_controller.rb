require 'rubygems'
require 'gchart'
class BenchmarkingsController < ApplicationController
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
    
    @benchmarking = nil
    if building != nil
      @benchmarking = building.benchmarking
    end 
  end 
  
  def update
    if $CBES_SHOW >= $CBES_SHOW_STATEMENT
      endTime = Time.now()
      puts "Start to update Benchmarking Controller."
    end
    @benchmarking = Benchmarking.find(params[:id])
    @benchmarking.officeWeeklyOperationHours =params[:officeWeeklyOperationHours]
    @benchmarking.officeNumberOfComputers =params[:officeNumberOfComputers]
    @benchmarking.officeNumberOfWorkers =params[:officeNumberOfWorkers]
    @benchmarking.retailWeeklyOperationHours =params[:retailWeeklyOperationHours]
    @benchmarking.retailNumberOfComputers =params[:retailNumberOfComputers]
    @benchmarking.retailNumberOfWorkers =params[:retailNumberOfWorkers]  
    @benchmarking.resultOutOfDate= nil
    
    # If can't save, don't benchmark
    if @benchmarking.save
      if $CBES_SHOW >= $CBES_SHOW_STATEMENT
          startTime = endTime
          endTime = Time.now()
          puts "    Save the changes to database: " + '%.2f' % (endTime-startTime) + 's'
       end
       
      basicInformaiton = BasicInformationsController.to_API_Model(@benchmarking.basic_information)
      energyUsage = EnergyUsagesController.to_API_Model(@benchmarking.energy_usage)
      
      benchmarking= BenchmarkingsController.to_API_Model(@benchmarking)
      if benchmarking.run(basicInformaiton, energyUsage)
        
       if $CBES_SHOW >= $CBES_SHOW_STATEMENT
          startTime = endTime
          endTime = Time.now()
          puts "    Call Preliminary Retrofit API: " + '%.2f' % (endTime-startTime) + 's'
       end
       
        @benchmarking.energyStarScore= benchmarking.energyStarScore
        @benchmarking.energyIQCount= benchmarking.energyIQCount
        @benchmarking.energyIQDescription = benchmarking.energyIQDescription
        
        #remove the existing frequencies distribution results
        if @benchmarking.benchmark_freq_distributions != nil
           @benchmarking.benchmark_freq_distributions.each do |benchmarkFreqDistribution|
            benchmarkFreqDistribution.destroy
           end
        end
         
        @benchmarking.annualSiteEnergy= benchmarking.annualSiteEnergy
        @benchmarking.energyIQScore= benchmarking.energyIQScore      
        
        
         if $CBES_SHOW >= $CBES_SHOW_STATEMENT
            startTime = endTime
            endTime = Time.now()
            puts "    Clean old result: " + '%.2f' % (endTime-startTime) + 's'
         end
        
        for i in 0..benchmarking.energyIQFrequencyList.count-1
          benchmark_freq_distribution = BenchmarkFreqDistribution.new                       
          benchmark_freq_distribution.benchmarking= @benchmarking
          benchmark_freq_distribution.energyIQFrequency= benchmarking.energyIQFrequencyList[i]
          benchmark_freq_distribution.energyIQValue= benchmarking.energyIQValueList[i]

          if not benchmark_freq_distribution.save
             @benchmarking.errors[:UpdateErrors] = "Fail to save some results to BenchmarkFreqDistribution object."
             break
          end
        end
        
         if $CBES_SHOW >= $CBES_SHOW_STATEMENT
            startTime = endTime
            endTime = Time.now()
            puts "        Create new result object: " + '%.2f' % (endTime-startTime) + 's'
         end  
         
        @benchmarking.resultOutOfDate= false
        @benchmarking.save
        @benchmarking= Benchmarking.find(params[:id])
        
       if $CBES_SHOW >= $CBES_SHOW_STATEMENT
          startTime = endTime
          endTime = Time.now()
          puts "        Save Results: " + '%.2f' % (endTime-startTime) + 's'
       end
       
      else
        @benchmarking.errors[:UpdateErrors] = "Fail to perform benchmarking.\nErrors: " + benchmarking.error
      end   
    end
    
    respond_to do |format|
        format.html {  render :action=>:edit }
    end
  end

  def self.to_API_Model(obj)    
    benchmarking = CBES::Benchmarking.new
    benchmarking.officeWeeklyOperationHours= obj.officeWeeklyOperationHours
    benchmarking.officeNumberOfComputers= obj.officeNumberOfComputers
    benchmarking.officeNumberOfWorkers= obj.officeNumberOfWorkers
    benchmarking.retailWeeklyOperationHours= obj.retailWeeklyOperationHours
    benchmarking.retailNumberOfComputers= obj.retailNumberOfComputers
    benchmarking.retailNumberOfWorkers= obj.retailNumberOfWorkers
    return benchmarking
  end
end
