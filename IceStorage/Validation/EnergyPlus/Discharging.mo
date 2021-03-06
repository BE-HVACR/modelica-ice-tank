within IceStorage.Validation.EnergyPlus;
model Discharging "Discharging mode"
  extends IceStorage.Validation.BaseClasses.PartialExample(
   fileName=Modelica.Utilities.Files.loadResource(
    "modelica://IceStorage/Resources/data/Validation/EnergyPlus/discharging.txt"),
   redeclare IceStorage.Data.IceThermalStorage.EnergyPlus per,
   mod(k=Integer(IceStorage.Types.IceThermalStorageMode.Discharging)),
   mIce_max=5E07/333550,
   mIce_start=0.998733201*mIce_max);

  annotation (
    experiment(
      StartTime=0,
      StopTime=28920,
      Tolerance=1e-06,
      __Dymola_Algorithm="Cvode"),
    __Dymola_Commands(file=
      "modelica://IceStorage/Resources/scripts/dymola/Validation/EnergyPlus/Discharging.mos"
        "Simulate and Plot"),
    Documentation(info="<html>
<p>
This example is to validate the developed tank model for discharging.
</p>

</html>", revisions="<html>
<ul>
<li>
December 14, 2021, by Yangyang Fu:<br/>
First implementation.
</li>
</ul>
</html>"));
end Discharging;
