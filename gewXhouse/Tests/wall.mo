within gewXhouse.Tests;

model wall

  Modelica.SIunits.SpecificHeatCapacityAtConstantPressure cp = 1005 "air J/kg.K";
  Modelica.SIunits.ThermalConductivity lambda = 0.76 "glass W/m.K";
  Modelica.SIunits.Mass m = 30 "kg";
  Modelica.SIunits.Area S = 10 "m2";
  parameter Modelica.SIunits.Length w = 0.05 "m";
  Modelica.SIunits.Temp_C T_in (start = 20) "°C";
  parameter Modelica.SIunits.Temp_C T_out = 0 "°C";
  Modelica.SIunits.HeatFlowRate Q_flow "J/s";
  Modelica.SIunits.HeatCapacity C_in "J/K";
  
equation

  C_in = m*cp;
  C_in*der(T_in) = Q_flow;
  Q_flow =  S * lambda * (T_out - T_in) / w;



annotation(
    experiment(StartTime = 0, StopTime = 1000, Tolerance = 1e-06, Interval = 1));end wall;
