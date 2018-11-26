within gewXhouse.Tests;

model ventilation
  Modelica.SIunits.SpecificHeatCapacityAtConstantPressure cp = 1005 "air J/kg.K";
  parameter Modelica.SIunits.ThermalConductivity lambda = 0.76 "glass W/m.K";
  parameter Modelica.SIunits.Mass m = 30 "kg";
  parameter Modelica.SIunits.Area S = 10 "m2";
  parameter Modelica.SIunits.Length w = 0.005 "m";
  Modelica.SIunits.Temp_C T_in(start = 20) "°C";
  parameter Modelica.SIunits.Temp_C T_out = 40 "°C";
  Modelica.SIunits.HeatFlowRate Q_flow "J/s";
  Modelica.SIunits.HeatCapacity C_in "J/K";
  Modelica.SIunits.Volume V =30 "m3";
  Modelica.SIunits.Density dl=1.2041 "Dichte Luft kg/m^3";
  Real nl = 0.01 "Lüftungsrate 1/s";
  Real V_on_off=1 "1: Ventilation On / 0:Ventilation Off";
equation
  C_in = m * cp;
  C_in * der(T_in) = Q_flow;
  Q_flow =  dl*cp*nl*V*(T_out - T_in)*V_on_off ;
  annotation(
    experiment(StartTime = 0, StopTime = 1000, Tolerance = 1e-06, Interval = 1));
end ventilation;
