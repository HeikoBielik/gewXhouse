within gewXhouse.Models.Greenhouse;

model ground
  "Boden wird als Speichermasse im Raum angenommen"

  parameter Modelica.SIunits.Length l = 3 "Länge";
  parameter Modelica.SIunits.Length b = 3 "Breite";
  parameter Modelica.SIunits.Length t=0.30 "Tiefe Boden";
  parameter Modelica.SIunits.Density de=1000 "Kg/m^3 Dichte Planzenerde MÜSSTE eigentlich 1 sein!!!!!!";
  parameter Modelica.SIunits.SpecificHeatCapacityAtConstantPressure ce=1000 "J/Kg*K spezifische Wärmekapazität Gartenerde";
  
  
  Modelica.SIunits.Area A "Fläche";
  Modelica.SIunits.Volume V "Volumen";
  Modelica.SIunits.Mass Me "Masse Pflanzenerde";
  Real Ce "Kapazität Erde";
 

equation

  A = l*b;
  V=A*t;
  Me=V*de;
  
  Ce=Me*ce;
  
 annotation(
    Icon(graphics = {Polygon(origin = {0, -60}, lineThickness = 0.75, points = {{-80, -20}, {40, -20}, {80, 20}, {40, -20}, {-80, -20}}), Line(origin = {-0.21, -60.21}, points = {{80.2071, 20.2071}, {-39.7929, 20.2071}, {-79.7929, -19.7929}}, pattern = LinePattern.Dash, thickness = 0.75), Polygon(origin = {-20, -10}, lineThickness = 0.75, points = {{-60, -70}, {-60, 10}, {0, 70}, {60, 10}, {60, -70}, {-60, -70}, {-60, -70}}), Polygon(origin = {30, 40}, lineThickness = 0.75, points = {{-50, 20}, {-10, 40}, {50, -20}, {10, -40}, {10, -40}, {-50, 20}}), Line(origin = {80, -9.5}, points = {{0, 29.5}, {0, -30.5}, {0, -28.5}}, thickness = 0.75), Polygon(origin = {-30, 40}, pattern = LinePattern.Dash, points = {{-50, -40}, {-10, -20}, {50, 40}, {-10, -20}, {-10, -20}, {-50, -40}}), Line(origin = {-40, -9.5}, points = {{0, 29.5}, {0, -12.5}, {0, -30.5}, {0, -10.5}}, pattern = LinePattern.Dash), Line(origin = {19.5, 20}, points = {{-59.5, 0}, {60.5, 0}, {-21.5, 0}}, pattern = LinePattern.Dash), Polygon(origin = {0, -60}, fillColor = {170, 85, 0}, fillPattern = FillPattern.Solid, points = {{-40, 20}, {-80, -20}, {40, -20}, {80, 20}, {-4, 20}, {-40, 20}}), Line(origin = {40, -39.5}, points = {{0, 39.5}, {0, -40.5}, {0, 17.5}}, thickness = 0.75)}));
 end ground;
