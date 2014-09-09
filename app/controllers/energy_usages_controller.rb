class EnergyUsagesController < ApplicationController
  def self.to_API_Model(obj)
      energyUsage = CBES::EnergyUsage.new
      
      electricityUsageMonthly= Array.new()
      naturalGasUsageMonthly = Array.new()
  
      electricityUsageMonthly.push(obj.electricityUsageMonthly_1) 
      naturalGasUsageMonthly.push(obj.naturalGasUsageMonthly_1) 
      electricityUsageMonthly.push(obj.electricityUsageMonthly_2) 
      naturalGasUsageMonthly.push(obj.naturalGasUsageMonthly_2)   
      electricityUsageMonthly.push(obj.electricityUsageMonthly_3) 
      naturalGasUsageMonthly.push(obj.naturalGasUsageMonthly_3)   
      electricityUsageMonthly.push(obj.electricityUsageMonthly_4) 
      naturalGasUsageMonthly.push(obj.naturalGasUsageMonthly_4)   
      electricityUsageMonthly.push(obj.electricityUsageMonthly_5) 
      naturalGasUsageMonthly.push(obj.naturalGasUsageMonthly_5)   
      electricityUsageMonthly.push(obj.electricityUsageMonthly_6) 
      naturalGasUsageMonthly.push(obj.naturalGasUsageMonthly_6)   
      electricityUsageMonthly.push(obj.electricityUsageMonthly_7) 
      naturalGasUsageMonthly.push(obj.naturalGasUsageMonthly_7)   
      electricityUsageMonthly.push(obj.electricityUsageMonthly_8) 
      naturalGasUsageMonthly.push(obj.naturalGasUsageMonthly_8)   
      electricityUsageMonthly.push(obj.electricityUsageMonthly_9) 
      naturalGasUsageMonthly.push(obj.naturalGasUsageMonthly_9)   
      electricityUsageMonthly.push(obj.electricityUsageMonthly_10) 
      naturalGasUsageMonthly.push(obj.naturalGasUsageMonthly_10)   
      electricityUsageMonthly.push(obj.electricityUsageMonthly_11) 
      naturalGasUsageMonthly.push(obj.naturalGasUsageMonthly_11)    
      electricityUsageMonthly.push(obj.electricityUsageMonthly_12) 
      naturalGasUsageMonthly.push(obj.naturalGasUsageMonthly_12)
      
      for i in 0..11
        if electricityUsageMonthly[i]==nil
          electricityUsageMonthly.delete_at(i)
          electricityUsageMonthly.insert(i,0)
        end
        if naturalGasUsageMonthly[i]==nil
          naturalGasUsageMonthly.delete_at(i)
          naturalGasUsageMonthly.insert(i,0)
        end
      end
      
      energyUsage.monthlyElectricityUsageList=electricityUsageMonthly
      energyUsage.monthlyNaturalGasUsageList=naturalGasUsageMonthly
      energyUsage.meter1stBillYear= obj.meter1stBillYear
      energyUsage.meter1stBillMonth= obj.meter1stBillMonth   
      
      return energyUsage
  end 
end
