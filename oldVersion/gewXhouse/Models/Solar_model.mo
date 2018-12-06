within gewXhouse.Models;

model Solar_model 

//  parameter Real tau_Cov=0.85 "Cover"annotation (Dialog(group="Transmission"));
//  parameter Real tau_Air=0.13 "Air"  annotation (Dialog(group="Transmission"));
//  parameter Real rho_Cov=0.13 "Cover"annotation (Dialog(group="Reflection"));
//  parameter Real rho_Air=0.13 "Air"  annotation (Dialog(group="Reflection"));
//  parameter Real rho_Flr=0.07 "Floor"annotation (Dialog(group="Reflection"));

  final constant Real pi = Modelica.Constants.pi;
  parameter Integer N = 6;
  parameter Real surfacesPitch[N];
  parameter Real surfacesNorth[N];
  
  Modelica.SIunits.RadiantEnergyFluenceRate I "surface radiation";
  Modelica.SIunits.RadiantEnergyFluenceRate Ip "positive surface radiation";

  input gewXhouse.Connectors.Interfaces.HeatFluxInput  I_glob annotation(
    Placement(visible = true, transformation(extent = {{-140, -20}, {-100, 20}}, rotation = 0), iconTransformation(origin = {-110, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  input Modelica.Blocks.Interfaces.RealInput sunPos[2] "elevation, azimuth" annotation(
    Placement(visible = true, transformation(origin = {-120, 40}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-110, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  output gewXhouse.Connectors.Interfaces.HeatFluxOutput I_Intern annotation(
    Placement(visible = true, transformation(origin = {120, 1.77636e-15}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {110, 3.55271e-15}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));

algorithm
  for i in 1:N loop
    I := I_glob * (cos(surfacesPitch[i]) + cos(abs(sunPos[2] - surfacesNorth[i])) * sin(surfacesPitch[i]) * tan(sunPos[1]));
    Ip := Ip + (if I < 0 or sunPos[1] < 0 or (abs(surfacesPitch[i]-sunPos[1])) > 41 then 0 else I);
  end for;
  I_Intern := Ip;

  annotation(
    Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics),
    Icon(coordinateSystem(preserveAspectRatio = false, initialScale = 0.1), graphics = {Line(points = {{-100, 120}}), 
    Rectangle(origin = {0, 30}, fillColor = {127, 127, 127}, fillPattern = FillPattern.Solid, extent = {{-100, 0}, {100, 20}}), Rectangle(fillColor = {170, 255, 255}, fillPattern = FillPattern.Solid, extent = {{-100, 30}, {100, -30}}), Rectangle(origin = {0, -30}, fillColor = {170, 85, 0}, fillPattern = FillPattern.Solid, extent = {{-100, 0}, {100, -60}}), Rectangle(origin = {0, 50}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, extent = {{-100, 40}, {100, 0}}), Line(points = {{-80, 90}, {-40, 30}}, color = {180, 180, 180}, arrow = {Arrow.None, Arrow.Filled}, arrowSize = 8), Line(points = {{-40, 30}, {0, -30}}, color = {180, 180, 180}, arrow = {Arrow.None, Arrow.Filled}, arrowSize = 8), Line(points = {{0, -30}, {40, -90}}, color = {180, 180, 180}, arrow = {Arrow.None, Arrow.Filled}, arrowSize = 8), Line(points = {{-40, 30}, {0, 90}}, color = {180, 180, 180}, pattern = LinePattern.Dot, arrow = {Arrow.None, Arrow.Filled}, arrowSize = 8), Line(points = {{0, -30}, {40, 30}}, color = {180, 180, 180}, pattern = LinePattern.Dot, arrow = {Arrow.None, Arrow.Filled}, arrowSize = 8), Line(points = {{40, 30}, {80, 90}}, color = {180, 180, 180}, pattern = LinePattern.Dot, arrow = {Arrow.None, Arrow.Filled}, arrowSize = 8),
    Text(origin = {0, 14}, lineColor = {127, 127, 127}, fillColor = {0, 0, 255}, extent = {{-100, 76}, {100, 36}}, textString = "cover"), 
    Text(origin = {0, -14}, fillColor = {0, 0, 255}, extent = {{-100, 34}, {100, -6}}, textString = "air"), 
    Text(origin = {0, 24}, lineColor = {255, 255, 255}, fillColor = {0, 0, 255}, extent = {{-100, -64}, {100, -104}}, textString = "floor")}),
  experiment(StartTime = 0, StopTime = 86400, Tolerance = 1e-06, Interval = 86.5731));
end Solar_model;
