within gewXhouse.Tests;

model floor

  Modelica.SIunits.Temp_C T_air (start = 40) "°C";
  Modelica.SIunits.Temp_C T_floor (start = 20) "°C";
  parameter Modelica.SIunits.Mass m_floor = 500 "Masse Pflanzenerde";
  parameter Modelica.SIunits.Mass m_air = 30 "kg";
  parameter Modelica.SIunits.Area S = 9 "m2";
  Modelica.SIunits.HeatFlowRate Q_flow "J/s";
  Modelica.SIunits.HeatCapacity C_floor "J/K";
  Modelica.SIunits.HeatCapacity C_tot "J/K";
  Modelica.SIunits.HeatCapacity C_air "J/K";
  parameter Modelica.SIunits.SurfaceCoefficientOfHeatTransfer c = 8 "1.26 W/m2.K Humus";
  parameter Modelica.SIunits.SpecificHeatCapacityAtConstantPressure cp_floor=1000 "J/Kg*K spezifische Wärmekapazität Gartenerde";
  parameter Modelica.SIunits.SpecificHeatCapacityAtConstantPressure cp_air = 1005 "air J/kg.K";
  
equation
 
  Q_flow = c * S * (T_floor - T_air);
  C_floor = m_floor * cp_floor;
  C_air = m_air * cp_air;
  C_tot = C_floor + C_air;
  
  der(T_floor) = -Q_flow / C_floor;
  der(T_air) = Q_flow / C_air;

annotation(
    experiment(StartTime = 0, StopTime = 86400, Tolerance = 1e-06, Interval = 86.5731));end floor;
