
class BasicInformationsController < ApplicationController  
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
    
    @basic_information= nil
    @energy_usage= nil
    @flat_utility_rate= nil
    @emission= nil
    @investment= nil
    @smart_meter= nil
    if building != nil
      @basic_information = building.basic_information
      @energy_usage= building.energy_usage
      @flat_utility_rate= building.flat_utility_rate
      @emission= building.emission
      @investment= building.investment
      @smart_meter= building.smart_meter
    end
  end
  
  def update
     begin 
      session_number= session['bldg_id'] 
      if session_number== nil
        building = nil
      else
        building = Building.where(:session_number=>session_number).first        
      end
    rescue
      raise "System bug 10001."
    end

    @basic_information = building.basic_information
    @energy_usage= building.energy_usage
    @flat_utility_rate= building.flat_utility_rate
    @emission= building.emission
    @investment= building.investment
    @smart_meter= building.smart_meter
    
    zipcode= CBES::ZipcodeInformation.select(params[:zipcode].to_i)
    if zipcode.climateZoneList.class.to_s == "NilClass" or zipcode.latitude== nil 
      @basic_information.errors["Zipcode"]= "We don't have enough information about zipcode #{params[:zipcode].to_i} in our zipcode database yet. Please try another zipcode.\n"
    else
      @basic_information.buildingTypeID =params[:buildingTypeID]
      @basic_information.yearBuilt =params[:yearBuilt]
      @basic_information.zipcode =params[:zipcode]
      @basic_information.grossFloorArea =params[:grossFloorArea]
      @basic_information.retailFloorAreaPercentage= params[:retailFloorAreaPercentage]
      
      if @basic_information.buildingTypeID != nil
        if @basic_information.buildingTypeID < 4
           @basic_information.retailFloorAreaPercentage= 0
        elsif @basic_information.buildingTypeID < 6 
           @basic_information.retailFloorAreaPercentage= 100
        end
      end
      if zipcode.comElectricityRateList.class.to_s != nil
        @flat_utility_rate.electricityUsageCharge= CBES.convertUnit("$/MWh","$/kWh",zipcode.comElectricityRateList[0])
      end
      @flat_utility_rate.naturalGasUsageCharge= zipcode.comNaturalGasRate
      @flat_utility_rate.save
      
      @emission.electricityEmissionRate= zipcode.electricityEmissionFactor
      @emission.naturalGasEmissionRate= zipcode.naturalGasEmissionFactor
      @emission.save      
          
      @basic_information.save 
      
      if @basic_information.benchmarking.resultOutOfDate != nil
          @basic_information.benchmarking.resultOutOfDate= true 
          @basic_information.benchmarking.save
      end
      
      if @basic_information.preliminary_retrofit.resultOutOfDate != nil
          @basic_information.preliminary_retrofit.resultOutOfDate= true 
          @basic_information.preliminary_retrofit.save
      end
    end
    
    respond_to do |format|
        format.html {  render :action=>:edit }
    end
  end  
  
  def updateFlatUtilityRate         
    begin 
      session_number= session['bldg_id'] 
      if session_number== nil
        building = nil
      else
        building = Building.where(:session_number=>session_number).first        
      end
    rescue
      raise "System bug 10001."
    end

    @basic_information = building.basic_information
    @energy_usage= building.energy_usage
    @flat_utility_rate= building.flat_utility_rate
    @emission= building.emission
    @investment= building.investment
    @smart_meter= building.smart_meter
    
    @flat_utility_rate.electricityUsageCharge= params[:electricityUsageCharge]
    @flat_utility_rate.naturalGasUsageCharge= params[:naturalGasUsageCharge]
    @flat_utility_rate.electricityDemandCharge= params[:electricityDemandCharge]
    
    @flat_utility_rate.save
    
    if @basic_information.preliminary_retrofit.resultOutOfDate != nil
        @basic_information.preliminary_retrofit.resultOutOfDate= true 
        @basic_information.preliminary_retrofit.save
    end
    respond_to do |format|
        format.html {  render :action=>:edit }
    end
  end
  
  def updateEmission    
    begin 
      session_number= session['bldg_id'] 
      if session_number== nil
        building = nil
      else
        building = Building.where(:session_number=>session_number).first        
      end
    rescue
      raise "System bug 10001."
    end

    @basic_information = building.basic_information
    @energy_usage= building.energy_usage
    @flat_utility_rate= building.flat_utility_rate
    @emission= building.emission
    @investment= building.investment
    @smart_meter= building.smart_meter
    
    @emission.electricityEmissionRate= params[:electricityEmissionRate] 
    @emission.naturalGasEmissionRate= params[:naturalGasEmissionRate]
    @emission.save
    
    if @basic_information.preliminary_retrofit.resultOutOfDate != nil
        @basic_information.preliminary_retrofit.resultOutOfDate= true 
        @basic_information.preliminary_retrofit.save
    end
    respond_to do |format|
        format.html {  render :action=>:edit }
    end
  end  
  
  def updateInvestment    
    begin 
      session_number= session['bldg_id'] 
      if session_number== nil
        building = nil
      else
        building = Building.where(:session_number=>session_number).first        
      end
    rescue
      raise "System bug 10001."
    end

    @basic_information = building.basic_information
    @energy_usage= building.energy_usage
    @flat_utility_rate= building.flat_utility_rate
    @emission= building.emission
    @investment= building.investment
    @smart_meter= building.smart_meter
    
    @investment.maxBudget = params[:maxBudget]
    @investment.maxPaybackYear = params[:maxPaybackYear]
    @investment.priorityID = params[:priorityID]
    
    @investment.save
    
    if @basic_information.preliminary_retrofit.resultOutOfDate != nil
        @basic_information.preliminary_retrofit.resultOutOfDate= true 
        @basic_information.preliminary_retrofit.save
    end
    respond_to do |format|
        format.html {  render :action=>:edit }
    end
  end 
  
  def updateEnergyUsage    
    begin 
      session_number= session['bldg_id'] 
      if session_number== nil
        building = nil
      else
        building = Building.where(:session_number=>session_number).first        
      end
    rescue
      raise "System bug 10001."
    end

    @basic_information = building.basic_information
    @energy_usage= building.energy_usage
    @flat_utility_rate= building.flat_utility_rate
    @emission= building.emission
    @investment= building.investment
    @smart_meter= building.smart_meter
        
    @energy_usage.meter1stBillYear =params[:meter1stBillYear]
    @energy_usage.meter1stBillMonth =params[:meter1stBillMonth]
    
    @energy_usage.electricityUsageMonthly_1 =params[:electricityUsageMonthly_1]
    @energy_usage.electricityUsageMonthly_2 =params[:electricityUsageMonthly_2]
    @energy_usage.electricityUsageMonthly_3 =params[:electricityUsageMonthly_3]
    @energy_usage.electricityUsageMonthly_4 =params[:electricityUsageMonthly_4]
    @energy_usage.electricityUsageMonthly_5 =params[:electricityUsageMonthly_5]
    @energy_usage.electricityUsageMonthly_6 =params[:electricityUsageMonthly_6]
    @energy_usage.electricityUsageMonthly_7 =params[:electricityUsageMonthly_7]
    @energy_usage.electricityUsageMonthly_8 =params[:electricityUsageMonthly_8]
    @energy_usage.electricityUsageMonthly_9 =params[:electricityUsageMonthly_9]
    @energy_usage.electricityUsageMonthly_10 =params[:electricityUsageMonthly_10]
    @energy_usage.electricityUsageMonthly_11 =params[:electricityUsageMonthly_11]
    @energy_usage.electricityUsageMonthly_12 =params[:electricityUsageMonthly_12]
    
    @energy_usage.naturalGasUsageMonthly_1 =params[:naturalGasUsageMonthly_1]
    @energy_usage.naturalGasUsageMonthly_2 =params[:naturalGasUsageMonthly_2]
    @energy_usage.naturalGasUsageMonthly_3 =params[:naturalGasUsageMonthly_3]
    @energy_usage.naturalGasUsageMonthly_4 =params[:naturalGasUsageMonthly_4]
    @energy_usage.naturalGasUsageMonthly_5 =params[:naturalGasUsageMonthly_5]
    @energy_usage.naturalGasUsageMonthly_6 =params[:naturalGasUsageMonthly_6]
    @energy_usage.naturalGasUsageMonthly_7 =params[:naturalGasUsageMonthly_7]
    @energy_usage.naturalGasUsageMonthly_8 =params[:naturalGasUsageMonthly_8]
    @energy_usage.naturalGasUsageMonthly_9 =params[:naturalGasUsageMonthly_9]
    @energy_usage.naturalGasUsageMonthly_10 =params[:naturalGasUsageMonthly_10]
    @energy_usage.naturalGasUsageMonthly_11 =params[:naturalGasUsageMonthly_11]
    @energy_usage.naturalGasUsageMonthly_12 =params[:naturalGasUsageMonthly_12]
    @energy_usage.save
    
    if @basic_information.benchmarking.resultOutOfDate != nil
        @basic_information.benchmarking.resultOutOfDate= true 
        @basic_information.benchmarking.save
    end
    
    respond_to do |format|
        format.html {  render :action=>:edit }
    end
  end  
  
  def updateSmartMeter
    begin 
      session_number= session['bldg_id'] 
      if session_number== nil
        building = nil
      else
        building = Building.where(:session_number=>session_number).first        
      end
    rescue
      raise "System bug 10001."
    end

    @basic_information = building.basic_information
    @energy_usage= building.energy_usage
    @flat_utility_rate= building.flat_utility_rate
    @emission= building.emission
    @investment= building.investment
    @smart_meter= building.smart_meter
    
    electricityFile= params[:electricity_green_button]    
    naturalGasFile= params[:natural_gas_green_button]
    
    elecMonthlyValues= Array.new()
    gasMonthlyValues= Array.new()
    
    if electricityFile != nil
      elecFilename= Rails.root.join('db', 'user_data',"smart_meter_electricity_"+session['bldg_id'].to_s+".xml")
      File.open(elecFilename, 'w') do |file|
        file.write(electricityFile['xml_file'].read)
      end
      elecSmartMeter= CBES::SmartMeterData.new
      if not elecSmartMeter.readGreenButtonData(elecFilename, CBES::SmartMeterData::METER_ELECTRICITY)
        @smart_meter.errors[:UpdateErrors] =  elecSmartMeter.error
      else      
        elecMonthlyResults= elecSmartMeter.toMonthlyData
        elecStartYear= elecMonthlyResults[0].to_i
        elecStartMonth= elecMonthlyResults[1].to_i  
        elecMonthlyValues = elecMonthlyResults[2]
      end
    end
    
    if naturalGasFile != nil      
      gasFilename= Rails.root.join('db', 'user_data',"smart_meter_naturalgas_"+session['bldg_id'].to_s+".xml")
      File.open(gasFilename, 'w') do |file|
        file.write(naturalGasFile['xml_file'].read)
      end
      gasSmartMeter= CBES::SmartMeterData.new
      if not gasSmartMeter.readGreenButtonData(gasFilename, CBES::SmartMeterData::METER_NATURALGAS)
        @smart_meter.errors[:UpdateErrors] = gasSmartMeter.error
      else      
        gasMonthlyResults= gasSmartMeter.toMonthlyData
        gasStartYear= gasMonthlyResults[0].to_i
        gasStartMonth= gasMonthlyResults[1].to_i  
        gasMonthlyValues = gasMonthlyResults[2]
      end
    end   
          
     if naturalGasFile != nil and electricityFile != nil
        if gasStartYear != elecStartYear or gasStartMonth != elecStartMonth
          @smart_meter.errors[:UpdateErrors] = "The two files have differnet start time."
        end
     end
    
    if @smart_meter.errors.empty?
       if electricityFile != nil or naturalGasFile != nil
         if electricityFile != nil
            @energy_usage.meter1stBillMonth=  elecStartMonth   
            @energy_usage.meter1stBillYear= elecStartYear
            @smart_meter.hasElectricityFile= true 
          else
            @smart_meter.hasElectricityFile= false            
          end        
          
          if naturalGasFile != nil
            @energy_usage.meter1stBillMonth= gasStartMonth     
            @energy_usage.meter1stBillYear= gasStartYear
            @smart_meter.hasNaturalgasFile= true
          else
            @smart_meter.hasNaturalgasFile= false            
          end
          
          @energy_usage.electricityUsageMonthly_1= elecMonthlyValues[0]
          @energy_usage.electricityUsageMonthly_2= elecMonthlyValues[1]
          @energy_usage.electricityUsageMonthly_3= elecMonthlyValues[2]
          @energy_usage.electricityUsageMonthly_4= elecMonthlyValues[3]
          @energy_usage.electricityUsageMonthly_5= elecMonthlyValues[4]
          @energy_usage.electricityUsageMonthly_6= elecMonthlyValues[5]
          @energy_usage.electricityUsageMonthly_7= elecMonthlyValues[6]
          @energy_usage.electricityUsageMonthly_8= elecMonthlyValues[7]
          @energy_usage.electricityUsageMonthly_9= elecMonthlyValues[8]
          @energy_usage.electricityUsageMonthly_10= elecMonthlyValues[9]
          @energy_usage.electricityUsageMonthly_11= elecMonthlyValues[10]
          @energy_usage.electricityUsageMonthly_12= elecMonthlyValues[11]
          
          @energy_usage.naturalGasUsageMonthly_1= gasMonthlyValues[0]
          @energy_usage.naturalGasUsageMonthly_2= gasMonthlyValues[1]
          @energy_usage.naturalGasUsageMonthly_3= gasMonthlyValues[2]
          @energy_usage.naturalGasUsageMonthly_4= gasMonthlyValues[3]
          @energy_usage.naturalGasUsageMonthly_5= gasMonthlyValues[4]
          @energy_usage.naturalGasUsageMonthly_6= gasMonthlyValues[5]
          @energy_usage.naturalGasUsageMonthly_7= gasMonthlyValues[6]
          @energy_usage.naturalGasUsageMonthly_8= gasMonthlyValues[7]
          @energy_usage.naturalGasUsageMonthly_9= gasMonthlyValues[8]
          @energy_usage.naturalGasUsageMonthly_10= gasMonthlyValues[9]
          @energy_usage.naturalGasUsageMonthly_11= gasMonthlyValues[10]
          @energy_usage.naturalGasUsageMonthly_12= gasMonthlyValues[11]
          @energy_usage.save()
            
          if @basic_information.benchmarking.resultOutOfDate != nil
              @basic_information.benchmarking.resultOutOfDate= true 
              @basic_information.benchmarking.save
          end
          
          @smart_meter.save        
        end
    end
      
    respond_to do |format|
        format.html {  render :action=>:edit }
    end    
  end
 
  def self.to_API_Model(obj)
      basicInformaiton = CBES::BasicInformation.new
      basicInformaiton.buildingTypeID= obj.buildingTypeID
      basicInformaiton.yearBuilt= obj.yearBuilt
      basicInformaiton.zipcode= obj.zipcode
      basicInformaiton.grossFloorArea = obj.grossFloorArea
      basicInformaiton.retailFloorAreaPercentage= obj.retailFloorAreaPercentage
      
      return basicInformaiton
  end  
end
