within IceStorage.Validation.Experiment;
model DischargingDay1
  extends IceStorage.Validation.Experiment.BaseClasses.PartialExample(
   fileName=Modelica.Utilities.Files.loadResource(
    "modelica://IceStorage/Resources/data/Validation/Experiment/discharging-day1.txt"),
   mod(k=Integer(IceStorage.Types.IceThermalStorageMode.Discharging)),
   mIce_start=0.90996030*mIce_max);

 annotation (
    experiment(
      StartTime = 0,
      StopTime=19990,
      Tolerance=1e-06,
      __Dymola_Algorithm="Cvode"),
    __Dymola_Commands(file="modelica://IceStorage/Resources/scripts/dymola/Validation/Experiment/DischargingDay1.mos"
        "Simulate and Plot"),
    Documentation(info="<html>
<p>
This example is to validate the developed ice tank model for discharging mode using data generated from experiment 1.
</p>

</html>", revisions="<html>
<ul>
<li>
December 14, 2021, by Yangyang Fu:<br/>
First implementation.
</li>
</ul>
</html>"));
end DischargingDay1;
