class EmissionsController < ApplicationController  
  def self.to_API_Model(obj)
      emission = CBES::EmissionFactors.new
      emission.electricityEmissionFactor= obj.electricityEmissionRate
      emission.naturalGasEmissionFactor= obj.naturalGasEmissionRate
            
      return emission
  end  
end
