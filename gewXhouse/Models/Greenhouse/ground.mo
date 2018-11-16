within gewXhouse.Models.Greenhouse;

model ground
  "Boden wird als Speichermasse im Raum angenommen"

  parameter Real a = 0 "angular position relative to ground";
  parameter Real o = 0 "angular position relative to north";
  Modelica.SIunits.RadiantEnergyFluenceRate I;
  Modelica.SIunits.RadiantEnergyFluenceRate Ip;
  Modelica.SIunits.HeatFlowRate Q;
  Modelica.SIunits.HeatFlowRate Qw "Wärmeübertragung Boden->Luft";
  Modelica.SIunits.SurfaceCoefficientOfHeatTransfer Rue = 50 "1.26 W/m2.K Humus";
  
  Modelica.SIunits.Temp_C T(start = 20)  "Temperature inside";
  
  parameter Modelica.SIunits.Length l = 3 "Länge";
  parameter Modelica.SIunits.Length w = 3 "Breite";
  parameter Modelica.SIunits.Length d=0.30 "Tiefe Boden";
  parameter Modelica.SIunits.Density de=500 "Kg/m^3";
  parameter Modelica.SIunits.SpecificHeatCapacityAtConstantPressure ce=1000 "J/Kg.K spezifische Wärmekapazität Gartenerde";
  
  
  Modelica.SIunits.Area S "Fläche";
  Modelica.SIunits.Volume V "Volumen";
  Modelica.SIunits.Mass m "Masse Pflanzenerde";
  Modelica.SIunits.HeatCapacity Ce "J/K Kapazität Erde";
 

equation

  S = l*w;
  V = S*d;
  m= V*de;
  
  Ce=m*ce;
  
 annotation(
    Icon(graphics = {Polygon(origin = {0, -60}, fillColor = {170, 85, 0}, pattern = LinePattern.None, fillPattern = FillPattern.Solid, points = {{-40, 20}, {-80, -20}, {40, -20}, {80, 20}, {-4, 20}, {-40, 20}})}, coordinateSystem(initialScale = 0.1)),
    experiment(StartTime = 0, StopTime = 86400, Tolerance = 1e-06, Interval = 86.5731));
 end ground;
