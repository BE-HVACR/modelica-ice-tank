within IceStorage.Calibration;
model IceTankDischargingDay1_NIST
  extends Modelica.Icons.Example;

  parameter Modelica.SIunits.Mass mIce_max=2846.35
    "Nominal mass of ice in the tank";
  parameter Modelica.SIunits.Mass mIce_start=0.90996030*mIce_max
    "Start value of ice mass in the tank";
  parameter String fileName=Modelica.Utilities.Files.loadResource("modelica://VirtualTestbed/Resources/data/NISTChillerTestbed/Component/Calibration/discharging-chiller-ice-day1_NIST.txt")
    "File where matrix is stored";

  package Medium = Buildings.Media.Antifreeze.PropyleneGlycolWater (
    property_T=293.15,
    X_a=0.30);

  IceTank.IceTank iceTan(
    redeclare package Medium = Medium,
    m_flow_nominal=1,
    dp_nominal=100000,
    mIce_max=mIce_max,
    mIce_start=mIce_start,
    Hf=333550)
    annotation (Placement(transformation(extent={{-10,-10},{10,10}})));
  Buildings.Fluid.Sources.MassFlowSource_T sou(
    redeclare package Medium = Medium,
    use_m_flow_in=true,
    use_T_in=true,                             nPorts=1)
    annotation (Placement(transformation(extent={{-54,-10},{-34,10}})));
  Buildings.Fluid.Sources.Boundary_pT bou(redeclare package Medium = Medium,
                                          nPorts=1)
    annotation (Placement(transformation(extent={{86,-10},{66,10}})));
  Buildings.Fluid.FixedResistances.PressureDrop res(
    redeclare package Medium = Medium,
    m_flow_nominal=1,
    dp_nominal=500)
    annotation (Placement(transformation(extent={{26,-10},{46,10}})));
  Modelica.Blocks.Sources.IntegerConstant
                                       mod(k=Integer(IceTank.Types.IceThermalStorageMode.Discharging))
    "Mode"
    annotation (Placement(transformation(extent={{-60,60},{-40,80}})));
  Modelica.Blocks.Sources.CombiTimeTable dat(
    tableOnFile=true,
    tableName="tab",
    columns=2:5,
    fileName=fileName)
                 "Flowrate measurements"
    annotation (Placement(transformation(extent={{-100,60},{-80,80}})));

  Modelica.Thermal.HeatTransfer.Celsius.ToKelvin inCToK
    annotation (Placement(transformation(extent={{-92,24},{-72,44}})));
  Modelica.Thermal.HeatTransfer.Celsius.ToKelvin outCToK
    annotation (Placement(transformation(extent={{-80,-50},{-60,-30}})));

equation
  connect(sou.ports[1], iceTan.port_a)
    annotation (Line(points={{-34,0},{-10,0}}, color={0,127,255}));
  connect(iceTan.port_b, res.port_a)
    annotation (Line(points={{10,0},{26,0}}, color={0,127,255}));
  connect(res.port_b, bou.ports[1])
    annotation (Line(points={{46,0},{66,0}}, color={0,127,255}));
  connect(mod.y, iceTan.u) annotation (Line(points={{-39,70},{-20,70},{-20,8},{-12,
          8}}, color={255,127,0}));
  connect(dat.y[3], sou.m_flow_in) annotation (Line(points={{-79,70},{-64,70},{-64,
          8},{-56,8}}, color={0,0,127}));
  connect(dat.y[1], inCToK.Celsius) annotation (Line(points={{-79,70},{-70,70},{
          -70,48},{-98,48},{-98,34},{-94,34}}, color={0,0,127}));
  connect(inCToK.Kelvin, sou.T_in) annotation (Line(points={{-71,34},{-66,34},{-66,
          4},{-56,4}}, color={0,0,127}));
  connect(dat.y[2],outCToK. Celsius) annotation (Line(points={{-79,70},{-70,70},
          {-70,48},{-98,48},{-98,-40},{-82,-40}}, color={0,0,127}));
  connect(outCToK.Kelvin, iceTan.TOutSet) annotation (Line(points={{-59,-40},{
          -20,-40},{-20,3},{-12,3}}, color={0,0,127}));
  annotation (
    experiment(StartTime = 0, StopTime=19990, __Dymola_Algorithm="Dassl"),
    __Dymola_Commands(file="modelica://VirtualTestbed/Resources/scripts/dymola/NISTChillerTestbed/Component/Calibration/IceTankDischargingDay1.mos"
        "Simulate and Plot"),
    Documentation(info="<html>
<p>
This example is to validate the developed tank model against real measurement from NIST chiller tank testbed on day 1.
</p>

</html>", revisions="<html>
April 2021, Yangyang Fu <\\b>
First implementation

</html>"));
end IceTankDischargingDay1_NIST;
