class FlatUtilityRatesController < ApplicationController
  def self.to_API_Model(obj)
      flatUtilityRate = CBES::FlatUtilityRates.new
      flatUtilityRate.electricityDemandCharge= obj.electricityDemandCharge
      flatUtilityRate.electricityUsageCharge= obj.electricityUsageCharge
      flatUtilityRate.naturalGasUsageCharge= obj.naturalGasUsageCharge
      return flatUtilityRate
  end  

end
