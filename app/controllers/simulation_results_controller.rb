class SimulationResultsController < ApplicationController
  def self.from_API_Model(obj)
    simulation_result = SimulationResult.new
    simulation_result.annualEnergyCost  =    obj.annualEnergyCost    # $
    simulation_result.annualEnergyConsumption  =    obj.annualEnergyConsumption  # kWh
    simulation_result.annualCO2Emission  =    obj.annualCO2Emission   # lbs
    simulation_result.annualElectricityCost  =    obj.annualElectricityCost # $  
    simulation_result.annualNaturalGasCost  =    obj.annualNaturalGasCost  # $
    simulation_result.annualElectricity  =    obj.annualElectricity # kWh 
    simulation_result.annualNaturalGas  =    CBES.convertUnit("kWh", "therm",obj.annualNaturalGas )    
    simulation_result.annualElectricityDemandCost = obj.annualElectricityDemandCost
    simulation_result.save
    return simulation_result
  end
end
