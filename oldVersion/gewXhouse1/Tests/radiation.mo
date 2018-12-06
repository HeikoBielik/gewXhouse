within gewXhouse.Tests;

model radiation

  Modelica.SIunits.SpecificHeatCapacityAtConstantPressure cp = 1005 "air J/kg.K";
  parameter Modelica.SIunits.Mass m = 30 "kg";
  parameter Modelica.SIunits.Area S = 30 "m2";
  Modelica.SIunits.Temp_C T_in (start = 20) "°C";
  Modelica.SIunits.HeatFlowRate Q_flow "J/s";
  Modelica.SIunits.HeatCapacity C_in "J/K";
  parameter Modelica.SIunits.RadiantEnergyFluenceRate I = 100 "W/m2";
  
equation

  Q_flow = I * S;
  C_in = m * cp;
  der(T_in) = Q_flow / C_in;
  
  
annotation(
    experiment(StartTime = 0, StopTime = 5000, Tolerance = 1e-06, Interval = 5));end radiation;
