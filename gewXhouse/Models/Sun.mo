within gewXhouse.Models;

model Sun

//parameter Real lat   = 48.8785888 "latitude";
  //parameter Real long  = 8.7172797 "longitude";
  constant Real pi    = 3.141592654;
  parameter Real day   = 26;
  parameter Real month = 7;
  parameter Real cloudy = 0 "Cloudy in % '0 = no cloud'";
  //Modelica.SIunits.Angle elevation;
  //Modelica.SIunits.Angle azimuth;
  Real delta "declination angle";
  Real n     "day number, such that for n = 1 is January 1st";
  Real m     "part of the year";
  Real omega "hour angle";
  Real alpha "altitude angle";
  Real beta  "the solar azimuth angle";
  Real hour  "actual time";
  Real phi   "time equation";
  Real K;
  gewXhouse.Connectors.Interfaces.HeatFluxOutput I_glob annotation(
    Placement(visible = true, transformation(origin = {110, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {110, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  output Modelica.Blocks.Interfaces.RealOutput sunPos[2] annotation(
    Placement(visible = true, transformation(origin = {110, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {110, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  input Modelica.Blocks.Interfaces.RealInput posHouse[2] "long,lat" annotation(
    Placement(visible = true, transformation(origin = {100, -50}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {110, -40}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
equation

  hour  = time / 60 / 60;
  n     = (month - 1) * 30.3 + day;
//n     = TimeElapsedFromJanuary1st("26/06_00:00:00");
  K     = pi / 180;
  m     = (n - 1 + (hour - 12) / 24) / 365;
  delta = (0.006918 - 0.399912 * cos(2 * pi * m) + 0.070257 * sin(2 * pi * m) - 0.006758 * cos(4 * pi * m) + 0.000907 * sin(4 * pi * m) - 0.002697 * cos(6 * pi * m) + 0.00148 * sin(6 * pi * m)) / K;
  phi   = 229.18 * (0.000075 + 0.001868 * cos(2 * pi * m) - 0.032077 * sin(2 * pi * m) - 0.014615 * cos(4 * pi * m) - 0.040849 * sin(4 * pi * m));
  omega = (hour * 60 + phi + 4 * posHouse[1] - 60) / 4 - 180;
  alpha = sin(K * posHouse[2]) * sin(K * delta) + cos(K * posHouse[2]) * cos(K * delta) * cos(K * omega);
  beta  = -(sin(K * posHouse[2]) * alpha - sin(K * delta)) / (cos(K * posHouse[2]) * sin(acos(alpha)));
  
  
  sunPos[1] = asin(alpha) / K;
  sunPos[2]   = if der(beta) < 0 then acos(beta) / K else 360 - acos(beta) / K;
  I_glob     = (-1) * 3000 + 5000 * sin(0.000035 * time) * (1- (cloudy/100));


annotation(
    defaultComponentName = "sun",
    Icon(graphics = {Text(origin = {0, -50}, lineColor = {190, 0, 0}, extent = {{-180, -28}, {180, -60}}, textString = "%name"), Ellipse(lineColor = {255, 128, 0}, fillColor = {255, 226, 6}, fillPattern = FillPattern.Solid, extent = {{-40, 40}, {40, -40}}, endAngle = 360), Line(points = {{80, 0}, {50, 0}}, color = {255, 128, 0}), Line(rotation = 45, points = {{80, 0}, {50, 0}}, color = {255, 128, 0}), Line(rotation = 90, points = {{80, 0}, {50, 0}}, color = {255, 128, 0}), Line(rotation = 135, points = {{80, 0}, {50, 0}}, color = {255, 128, 0}), Line(rotation = 180, points = {{80, 0}, {50, 0}}, color = {255, 128, 0}), Line(rotation = 225, points = {{80, 0}, {50, 0}}, color = {255, 128, 0}), Line(rotation = 270, points = {{80, 0}, {50, 0}}, color = {255, 128, 0}), Line(rotation = 315, points = {{80, 0}, {50, 0}}, color = {255, 128, 0}), Polygon(origin = {24, -39}, lineColor = {0, 0, 255}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, points = {{-54, -3}, {-42, 17}, {-10, 27}, {32, 29}, {54, 9}, {50, -17}, {18, -29}, {-40, -25}, {-54, -3}})}, coordinateSystem(initialScale = 0.1)));
  
end Sun;
