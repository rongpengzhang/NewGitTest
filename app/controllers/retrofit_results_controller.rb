class RetrofitResultsController < ApplicationController
  def self.from_API_Model(obj)       
 
    retrofit_result = RetrofitResult.new
    
    retrofit_result.annualEnergyCost  =    obj.retrofitSimulationResult.simulationResult.annualEnergyCost    # $
    retrofit_result.annualEnergyConsumption  =    obj.retrofitSimulationResult.simulationResult.annualEnergyConsumption  # kWh
    retrofit_result.annualCO2Emission  =    obj.retrofitSimulationResult.simulationResult.annualCO2Emission   # lbs
    retrofit_result.annualElectricityCost  =    obj.retrofitSimulationResult.simulationResult.annualElectricityCost # $  
    retrofit_result.annualNaturalGasCost  =    obj.retrofitSimulationResult.simulationResult.annualNaturalGasCost  # $
    retrofit_result.annualElectricity  =    obj.retrofitSimulationResult.simulationResult.annualElectricity # kWh 
    retrofit_result.annualNaturalGas  =    CBES.convertUnit("kWh", "therm",obj.retrofitSimulationResult.simulationResult.annualNaturalGas )    
    retrofit_result.annualElectricityDemandCost = obj.retrofitSimulationResult.simulationResult.annualElectricityDemandCost
    
    retrofit_result.annualEnergySaving= obj.retrofitSimulationResult.annualEnergySaving # kWh
    retrofit_result.annualElectricitySaving = obj.retrofitSimulationResult.annualElectricitySaving
    retrofit_result.annualNaturalGasSaving = CBES.convertUnit("kWh", "therm",obj.retrofitSimulationResult.annualNaturalGasSaving)
    retrofit_result.annualCO2EmissionReduction=      obj.retrofitSimulationResult.annualCO2EmissionReduction
    retrofit_result.annualEnergyCostSaving=      obj.retrofitSimulationResult.annualEnergyCostSaving
    retrofit_result.annualElectricityCostSaving = obj.retrofitSimulationResult.annualElectricityCostSaving
    retrofit_result.annualElectricityDemandCostSaving = obj.retrofitSimulationResult.annualElectricityDemandCostSaving
    retrofit_result.annualNaturalGasCostSaving  = obj.retrofitSimulationResult.annualNaturalGasCostSaving    
    
    retrofit_result.annualEnergySavingPercentage = obj.retrofitSimulationResult.annualEnergySavingPercentage
    retrofit_result.annualElectricitySavingPercentage = obj.retrofitSimulationResult.annualElectricitySavingPercentage
    retrofit_result.annualNaturalGasSavingPercentage = obj.retrofitSimulationResult.annualNaturalGasSavingPercentage
    retrofit_result.annualCO2EmissionReductionPercentage = obj.retrofitSimulationResult.annualCO2EmissionReductionPercentage
    retrofit_result.annualEnergyCostSavingPercentage = obj.retrofitSimulationResult.annualEnergyCostSavingPercentage
    retrofit_result.annualElectricityDemandCostSavingPercentage = obj.retrofitSimulationResult.annualElectricityDemandCostSavingPercentage
    retrofit_result.annualElectricityCostSavingPercentage = obj.retrofitSimulationResult.annualElectricityCostSavingPercentage
    retrofit_result.annualNaturalGasCostSavingPercentage = obj.retrofitSimulationResult.annualNaturalGasCostSavingPercentage      
      
    retrofit_result.investmentCost=      obj.investmentCost
    retrofit_result.paybackYear=      obj.paybackYear   
    retrofit_result.meetInvestmentCriteria = obj.meetInvestmentCriteria     
    
    fistECM= true 
    measureIDs=""
    obj.measureList.each do |measure|      
        if not fistECM 
          measureIDs += ";"                    
        else
            fistECM= false                          
        end
        measureIDs += measure.id.to_s
    end
        
    retrofit_result.measureIDs = measureIDs
    retrofit_result.save

    return retrofit_result
  end
end
