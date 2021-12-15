within IceStorage.Validation.EnergyPlus;
model Charging "Validation example for charging mode"
  extends IceStorage.Validation.BaseClasses.PartialExample(
   fileName=Modelica.Utilities.Files.loadResource(
    "modelica://IceStorage/Resources/data/Validation/EnergyPlus/charging.txt"),
   mod(k=Integer(IceStorage.Types.IceThermalStorageMode.Charging)),
   coeCha={0.318,0,0,0,0,0},
   coeDisCha={0.0,0.09,-0.15,0.612,-0.324,-0.216},
   dt = 3600,
   mIce_max=5E07/333550,
   mIce_start=0.605139456*mIce_max);

  annotation (
    experiment(
      StartTime=0,
      StopTime=4450,
      Tolerance=1e-06,
      __Dymola_Algorithm="Cvode"),
    __Dymola_Commands(file=
          "modelica://IceStorage/Resources/scripts/dymola/Validation/EnergyPlus/Charging.mos"
        "Simulate and Plot"),
    Documentation(info="<html>
<p>
This example is to validate the developed tank model for charging.
</p>

</html>", revisions="<html>
<ul>
<li>
December 14, 2021, by Yangyang Fu:<br/>
First implementation.
</li>
</ul>
</html>"));
end Charging;
