within IceStorage.Calibration.Experiment;
model DischargingDay2
  extends IceStorage.Calibration.Experiment.BaseClasses.PartialExample(
   fileName=Modelica.Utilities.Files.loadResource(
    "modelica://IceStorage/Resources/data/Calibration/Experiment/discharging-day2.txt"),
   mod(k=Integer(IceStorage.Types.IceThermalStorageMode.Discharging)),
   mIce_start=0.96645368*mIce_max);

  annotation (
    experiment(
      StartTime=0,
      StopTime=36890,
      Tolerance=1e-06,
      __Dymola_Algorithm="Cvode"),
    __Dymola_Commands(file="modelica://IceStorage/Resources/scripts/dymola/Calibration/Experiment/DischargingDay2.mos"
        "Simulate and Plot"),
    Documentation(info="<html>
<p>
This example is to validate the developed ice tank model for discharging mode using data generated from experiment 2.
</p>
</html>", revisions="<html>
<ul>
<li>
December 14, 2021, by Yangyang Fu:<br/>
First implementation.
</li>
</ul>
</html>"));
end DischargingDay2;