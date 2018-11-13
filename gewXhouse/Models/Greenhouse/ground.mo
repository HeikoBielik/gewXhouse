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
    Icon(graphics = {Polygon(origin = {0, -60}, lineThickness = 0.75, points = {{-80, -20}, {40, -20}, {80, 20}, {40, -20}, {-80, -20}}), Line(origin = {-0.21, -60.21}, points = {{80.2071, 20.2071}, {-39.7929, 20.2071}, {-79.7929, -19.7929}}, pattern = LinePattern.Dash, thickness = 0.75), Polygon(origin = {-20, -10}, lineThickness = 0.75, points = {{-60, -70}, {-60, 10}, {0, 70}, {60, 10}, {60, -70}, {-60, -70}, {-60, -70}}), Polygon(origin = {30, 40}, lineThickness = 0.75, points = {{-50, 20}, {-10, 40}, {50, -20}, {10, -40}, {10, -40}, {-50, 20}}), Line(origin = {80, -9.5}, points = {{0, 29.5}, {0, -30.5}, {0, -28.5}}, thickness = 0.75), Polygon(origin = {-30, 40}, pattern = LinePattern.Dash, points = {{-50, -40}, {-10, -20}, {50, 40}, {-10, -20}, {-10, -20}, {-50, -40}}), Line(origin = {-40, -9.5}, points = {{0, 29.5}, {0, -12.5}, {0, -30.5}, {0, -10.5}}, pattern = LinePattern.Dash), Line(origin = {19.5, 20}, points = {{-59.5, 0}, {60.5, 0}, {-21.5, 0}}, pattern = LinePattern.Dash), Polygon(origin = {0, -60}, fillColor = {170, 85, 0}, fillPattern = FillPattern.Solid, points = {{-40, 20}, {-80, -20}, {40, -20}, {80, 20}, {-4, 20}, {-40, 20}}), Line(origin = {40, -39.5}, points = {{0, 39.5}, {0, -40.5}, {0, 17.5}}, thickness = 0.75)}),
    experiment(StartTime = 0, StopTime = 86400, Tolerance = 1e-06, Interval = 86.5731));
 end ground;
