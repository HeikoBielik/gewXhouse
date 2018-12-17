within gewXhouse.Models;

model Sun
  final constant Real pi = Modelica.Constants.pi;
  Real K "deg to rad factor";
    
  Modelica.Blocks.Interfaces.RealInput posHouse[2] "long,lat" annotation(
    Placement(visible = true, transformation(origin = {110, -50}, extent = {{10, -10}, {-10, 10}}, rotation = 0), iconTransformation(origin = {110, 0}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Real lat "latitude (HSP: 48.8785888)";
  Real long "longitude (HSP: 8.7172797)";
  parameter Real day = 26 "Day" annotation(
    Dialog(group = "Date of siumlation"));
  parameter Real month = 7 "Month" annotation(
    Dialog(group = "Date of siumlation"));
  Real delta "declination angle";
  Real n "day number, such that for n = 1 is January 1st";
  Real m "m part of the year";
  Real omega "hour angle";
  Real alpha "altitude angle";
  Real beta "the solar azimuth angle";
  Real hour "actual time";
  Real phi "time equation";
  Modelica.Blocks.Interfaces.RealOutput sunPos[2] "altitude,azimuth" annotation(
    Placement(visible = true, transformation(origin = {110, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {110, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  
  parameter Real cloudy = 0 "Cloudy in % [0..100] '0 = no cloud'"  annotation(
    Dialog(group = "Environmental parameters"));
  parameter Real k = 0.171 "Factor of atmospheric influence"  annotation(
    Dialog(group = "Environmental parameters"));
  Real I_max "W/m2 maximal solar radiation";
  Modelica.Blocks.Interfaces.RealOutput I_glob "W/m2 direct solar radiation" annotation(
    Placement(visible = true, transformation(origin = {110, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {110, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
//---general---
  K = pi / 180;
//-------------
//---if input not used---
  if cardinality(posHouse[1]) == 0 then
    long = 8.7172797 "location of Pforzheim University";
  else
    long = posHouse[1];
  end if;
  if cardinality(posHouse[2]) == 0 then
    lat = 48.8785888 "location of Pforzheim University";
  else
    lat = posHouse[2];
  end if;
//-----------------------
//---calculate global solar radiation---
  I_max = (-1) * 3000 + 5000 * sin(0.000035 * (time - 86400 * integer(time / 86400)));
  I_glob = (I_max *k) * (1 - cloudy / 100);
//I_glob = if I<0 then 0 else I;
//--------------------------------------
//---calculate sun position---
  hour = time / 60 / 60;
  n = (month - 1) * 30.3 + day;
//Time elapsed from january 1st;
  m = (n - 1 + (hour - 12) / 24) / 365;
  delta = (0.006918 - 0.399912 * cos(2 * pi * m) + 0.070257 * sin(2 * pi * m) - 0.006758 * cos(4 * pi * m) + 0.000907 * sin(4 * pi * m) - 0.002697 * cos(6 * pi * m) + 0.00148 * sin(6 * pi * m)) / K;
  phi = 229.18 * (0.000075 + 0.001868 * cos(2 * pi * m) - 0.032077 * sin(2 * pi * m) - 0.014615 * cos(4 * pi * m) - 0.040849 * sin(4 * pi * m));
  omega = (hour * 60 + phi + 4 * long - 60) / 4 - 180;
  alpha = sin(K * lat) * sin(K * delta) + cos(K * lat) * cos(K * delta) * cos(K * omega);
  beta = -(sin(K * lat) * alpha - sin(K * delta)) / (cos(K * lat) * sin(acos(alpha)));
  
algorithm
  sunPos[1] := asin(alpha) / K;
  sunPos[2] := if der(beta) < 0 then acos(beta) / K else 360 - acos(beta) / K;
//----------------------------
  annotation(
    defaultComponentName = "sun",
    Icon(graphics = {Text(origin = {0, -60}, lineColor = {190, 0, 0}, extent = {{-180, -28}, {180, -60}}, textString = "%name"), Ellipse(lineColor = {255, 128, 0}, fillColor = {255, 226, 6}, fillPattern = FillPattern.Solid, extent = {{-40, 40}, {40, -40}}, endAngle = 360), Line(points = {{80, 0}, {50, 0}}, color = {255, 128, 0}), Line(rotation = 45, points = {{80, 0}, {50, 0}}, color = {255, 128, 0}), Line(rotation = 90, points = {{80, 0}, {50, 0}}, color = {255, 128, 0}), Line(rotation = 135, points = {{80, 0}, {50, 0}}, color = {255, 128, 0}), Line(rotation = 180, points = {{80, 0}, {50, 0}}, color = {255, 128, 0}), Line(rotation = 225, points = {{80, 0}, {50, 0}}, color = {255, 128, 0}), Line(rotation = 270, points = {{80, 0}, {50, 0}}, color = {255, 128, 0}), Line(rotation = 315, points = {{80, 0}, {50, 0}}, color = {255, 128, 0}), Polygon(origin = {24, -39}, lineColor = {0, 0, 255}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, points = {{-54, -3}, {-42, 17}, {-10, 27}, {32, 29}, {54, 9}, {50, -17}, {18, -29}, {-40, -25}, {-54, -3}})}, coordinateSystem(initialScale = 0.1)),
    Documentation(info = "<html><head></head><body><div><b><font size=\"4\">SUN MODEL</font></b></div><div><br></div><div><!--StartFragment--><div style=\"font-size: 12px;\">The sun model calculates the incoming solar radiation depending on the greenhouses position. The transmitted variables are azimuth angle, elevation angle, and the amount of solar radiation.</div><div style=\"font-size: 12px;\">User input parameters are the date to calculate the suns position as well as the amount of clouds on that day</div><!--EndFragment--></div><p></p> <p></p>
<p>Overview of sun input/output&nbsp;</p>
<table style=\"height: 200px; width: 574px; border-color: black; margin-left: auto; margin-right: auto;\" border=\"1\">
<tbody>
<tr style=\"height: 39px;\">
<td style=\"width: 79px; text-align: center; height: 39px;\">&nbsp;</td>
<td style=\"width: 199.35px; height: 39px; text-align: center;\"><strong>Variable</strong></td>
<td style=\"width: 272.65px; height: 39px; text-align: center;\"><strong>Description</strong></td>
</tr>
<tr style=\"height: 69px;\">
<td style=\"width: 79px; text-align: center; height: 69px;\"> <img src=\"modelica://gewXhouse/Resources/Output.jpg\" alt=\"Smiley face\" height=\"42\" width=\"42\"> <br><strong>Input</strong></td>
<td style=\"width: 199.35px; height: 69px; text-align: center;\">posHouse[2]</td>
<td style=\"width: 272.65px; height: 69px; text-align: center;\">
Position of the house with longitudinal and lateral coordinates</td>
</tr>

<tr style=\"height: 33.7167px;\">
<td style=\"width: 79px; text-align: center; height: 78.7167px;\" rowspan=\"2\"> <img src=\"modelica://gewXhouse/Resources/Input.jpg\" alt=\"Smiley face\" height=\"42\" width=\"42\"><strong>Output</strong></td>
<td style=\"width: 199.35px; height: 33.7167px;\">
<p style=\"text-align: center;\">I_glob</p>
</td>
<td style=\"width: 272.65px; height: 33.7167px; text-align: center;\">Direct solar radiation of the sun [w/m²]</td>
</tr>
<tr style=\"height: 45px;\">
<td style=\"width: 199.35px; height: 45px;\">
<p style=\"text-align: center;\">sunPos [2]</p>
</td>
<td style=\"width: 272.65px; height: 45px; text-align: center;\">sunPos[1] = elevation of the sun&nbsp;<br>sunPos[2] = azumiuth of the sun&nbsp;</td>
</tr>
</tbody>
</table>
<p>&nbsp;</p>
</body></html>"),
    experiment(StartTime = 0, StopTime = 1e+10, Tolerance = 1e-06, Interval = 1.00604e+07));
end Sun;
