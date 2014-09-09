class BuildingsController < ApplicationController
  # The enter of the program
  def index    
  end
  
  # Edit a previous analysis
  def edit
      session[:bldg_id]= params[:preSessionNo]
      respond_to do |format|
        format.html  { redirect_to :controller=> :basic_informations, :action=> :edit }
      end
  end 
  
  # Start a new analysis
  def new
    building = Building.new    
    building.save(:validate=>false)
    building.session_number= building.id * 10000 + rand(10000)
    
    detailed_retrofit = DetailedRetrofit.new
    preliminary_retrofit = PreliminaryRetrofit.new
    low_no_cost_improvement= LowNoCostImprovement.new    
    benchmarking = Benchmarking.new   
    basic_information = BasicInformation.new
    flat_utility_rate= FlatUtilityRate.new
    emission = Emission.new
    investment= Investment.new     
    energy_usage= EnergyUsage.new     
    smart_meter= SmartMeter.new     
    
    building.basic_information=  basic_information
    building.flat_utility_rate=  flat_utility_rate
    building.emission=  emission
    building.investment=  investment
    building.energy_usage = energy_usage
    building.benchmarking= benchmarking 
    building.preliminary_retrofit = preliminary_retrofit
    building.detailed_retrofit = detailed_retrofit
    building.low_no_cost_improvement = low_no_cost_improvement
    building.smart_meter= smart_meter
    
    benchmarking.basic_information= basic_information
    benchmarking.energy_usage = energy_usage
    
    low_no_cost_improvement.basic_information= basic_information
    low_no_cost_improvement.smart_meter= smart_meter    
    
    preliminary_retrofit.basic_information= basic_information    
    preliminary_retrofit.energy_usage = energy_usage
    preliminary_retrofit.flat_utility_rate= flat_utility_rate
    preliminary_retrofit.emission= emission
    preliminary_retrofit.investment= investment
    
    detailed_retrofit.basic_information= basic_information  
    detailed_retrofit.energy_usage = energy_usage  
    detailed_retrofit.flat_utility_rate= flat_utility_rate
    detailed_retrofit.emission= emission
    detailed_retrofit.investment= investment
    
    # Assign Default values for testing
    # Basic informaiton
    basic_information.buildingTypeID = 1
    basic_information.yearBuilt = 1978
    basic_information.zipcode = 94114
    basic_information.grossFloorArea = 5500
    basic_information.retailFloorAreaPercentage = 0
    
    # Energy price
    flat_utility_rate.electricityUsageCharge= 0.152
    flat_utility_rate.naturalGasUsageCharge= 0.99
    flat_utility_rate.electricityDemandCharge= 2.52
    
    # CO2 emission
    emission.electricityEmissionRate= 687
    emission.naturalGasEmissionRate= 413
    
    # Energy usage
    energy_usage.meter1stBillMonth= 1      
    energy_usage.meter1stBillYear= 2012
    
    monthly_elec= 5000
    energy_usage.electricityUsageMonthly_1= monthly_elec   
    energy_usage.electricityUsageMonthly_2= monthly_elec      
    energy_usage.electricityUsageMonthly_3= monthly_elec  
    energy_usage.electricityUsageMonthly_4= monthly_elec 
    energy_usage.electricityUsageMonthly_5= monthly_elec 
    energy_usage.electricityUsageMonthly_6= monthly_elec 
    energy_usage.electricityUsageMonthly_7= monthly_elec 
    energy_usage.electricityUsageMonthly_8= monthly_elec 
    energy_usage.electricityUsageMonthly_9= monthly_elec 
    energy_usage.electricityUsageMonthly_10= monthly_elec 
    energy_usage.electricityUsageMonthly_11= monthly_elec 
    energy_usage.electricityUsageMonthly_12= monthly_elec 
    
    monthly_gas = 40    
    energy_usage.naturalGasUsageMonthly_1= monthly_gas 
    energy_usage.naturalGasUsageMonthly_2= monthly_gas      
    energy_usage.naturalGasUsageMonthly_3= monthly_gas  
    energy_usage.naturalGasUsageMonthly_4= monthly_gas 
    energy_usage.naturalGasUsageMonthly_5= monthly_gas
    energy_usage.naturalGasUsageMonthly_6= monthly_gas 
    energy_usage.naturalGasUsageMonthly_7= monthly_gas 
    energy_usage.naturalGasUsageMonthly_8= monthly_gas
    energy_usage.naturalGasUsageMonthly_9= monthly_gas
    energy_usage.naturalGasUsageMonthly_10= monthly_gas
    energy_usage.naturalGasUsageMonthly_11= monthly_gas 
    energy_usage.naturalGasUsageMonthly_12= monthly_gas
    
    
    # Investment criteira
    investment.maxBudget= 80000.0
    investment.maxPaybackYear= 5
    investment.priorityID= 1
    
    # Smart meter
    smart_meter.hasNaturalgasFile= false
    smart_meter.hasElectricityFile= false

    # Benchmarking
    
    # Preliminary retrofit
    preliminary_retrofit.lightUpgradeID= 0
    preliminary_retrofit.windowUpgradeID= 0
    preliminary_retrofit.coolingUpgradeID= 0
    preliminary_retrofit.heatingUpgradeID= 0
    
    building.save(:validate=>false)
    detailed_retrofit.save(:validate=>false)
    preliminary_retrofit.save(:validate=>false)
    low_no_cost_improvement.save(:validate=>false)
    benchmarking.save(:validate=>false)
    basic_information.save(:validate=>false)
    flat_utility_rate.save(:validate=>false)
    emission.save(:validate=>false)
    investment.save(:validate=>false)
    energy_usage.save(:validate=>false)
    smart_meter.save(:validate=>false)
    
    session[:bldg_id]= building.session_number
      
     respond_to do |format|      
         format.html { redirect_to :controller=> :basic_informations, :action=> :edit }
      end
  end      
end
