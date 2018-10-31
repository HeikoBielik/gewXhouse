within gewXhouse.Models;

model Sun

  parameter Real lat = 48.8785888 "latitude";
  parameter Real long = 8.7172797 "longitude";
  parameter Real pi = 3.141592654;
  parameter Real day = 26, month = 6;
  Real delta "declination angle";
  Real n "day number, such that day = 1 on the 1st January";
  Real m "part of the year";
  Real omega "hour angle";
  Real alpha, elevation "altitude angle";
  Real beta, azimuth "the solar azimuth angle";
  Real hour "actual time";
  Real phi "time equation";
  Real K;
  
  Modelica.SIunits.RadiantEnergyFluenceRate I_Sn  "surface radiation north";
  Modelica.SIunits.RadiantEnergyFluenceRate I_Se  "surface radiation east";
  Modelica.SIunits.RadiantEnergyFluenceRate I_Ss  "surface radiation south";
  Modelica.SIunits.RadiantEnergyFluenceRate I_Sw  "surface radiation west";
  Modelica.SIunits.RadiantEnergyFluenceRate I_Sre "surface radiation roof east";
  Modelica.SIunits.RadiantEnergyFluenceRate I_Srw "surface radiation roof west";

  Real Ip_Sn;
  Real Ip_Se;
  Real Ip_Ss;
  Real Ip_Sw;
  Real Ip_Sre;
  Real Ip_Srw;

  Modelica.SIunits.RadiantEnergyFluenceRate I_dir "W/m2";   //I_dir
  Modelica.SIunits.HeatFlowRate Q_Sn,Q_Se, Q_Ss, Q_Sw, Q_Sre,Q_Srw;   //J/s
  
  gewXhouse.Models.Greenhouse.surface_north     Sn   annotation(
    Placement(visible = false, transformation(origin = {0, 0}, extent = {{-100, -100}, {100, 100}}, rotation = 0)));
  gewXhouse.Models.Greenhouse.surcafe_east      Se   annotation(
    Placement(visible = false, transformation(origin = {0, 0}, extent = {{-100, -100}, {100, 100}}, rotation = 0)));
  gewXhouse.Models.Greenhouse.surface_west      Sw   annotation(
    Placement(visible = false, transformation(origin = {0, 0}, extent = {{-100, -100}, {100, 100}}, rotation = 0)));
  gewXhouse.Models.Greenhouse.surface_roof_east Sre  annotation(
    Placement(visible = false, transformation(origin = {0, 0}, extent = {{-100, -100}, {100, 100}}, rotation = 0)));
  gewXhouse.Models.Greenhouse.surface_roof_west Srw  annotation(
    Placement(visible = false, transformation(origin = {0, 0}, extent = {{-100, -100}, {100, 100}}, rotation = 0)));
  gewXhouse.Models.Greenhouse.surface_south     Ss   annotation(
   Placement(visible = true, transformation(origin = {0, 0}, extent = {{-100, -100}, {100, 100}}, rotation = 0)));
  gewXhouse.Connectors.heat_radiation Radiation annotation(
    Placement(visible = true, transformation(origin = {68, -38}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {99, -55}, extent = {{-53, -53}, {53, 53}}, rotation = 0)));

equation

  hour  = time / 60 / 60;
  n     = (month - 1) * 30.3 + day;
  K     = pi / 180;
  m     = (n - 1 + (hour - 12) / 24) / 365;
  delta = (0.006918 - 0.399912 * cos(2 * pi * m) + 0.070257 * sin(2 * pi * m) - 0.006758 * cos(4 * pi * m) + 0.000907 * sin(4 * pi * m) - 0.002697 * cos(6 * pi * m) + 0.00148 * sin(6 * pi * m)) / K;
  phi   = 229.18 * (0.000075 + 0.001868 * cos(2 * pi * m) - 0.032077 * sin(2 * pi * m) - 0.014615 * cos(4 * pi * m) - 0.040849 * sin(4 * pi * m));
  omega = (hour * 60 + phi + 4 * long - 60) / 4 - 180;
  alpha = sin(K * lat) * sin(K * delta) + cos(K * lat) * cos(K * delta) * cos(K * omega);
  beta  = -(sin(K * lat) * alpha - sin(K * delta)) / (cos(K * lat) * sin(acos(alpha)));
  
  elevation = asin(alpha) / K;

  azimuth = if der(beta) < 0 then acos(beta) / K else 360 - acos(beta) / K;
  I_dir = (-1) * 3000 + 5000 * sin(0.000035 * time);
  I_Sn = I_dir * (cos(90 * K) + cos(abs(azimuth * K - 0 * K)) * sin(90 * K) * tan((if elevation < 0 then 0 else elevation) * K));
  Ip_Sn = if I_Sn < 0 then 0 else  I_Sn;
  I_Se = I_dir * (cos(90 * K) + cos(abs(azimuth * K - 90 * K)) * sin(90 * K) * tan(elevation * K));
  Ip_Se = if I_Se<0 then 0 else if elevation <0 then 0 else I_Se;
  I_Ss = I_dir * (cos(90 * K) + cos(abs(azimuth * K - 180 * K)) * sin(90 * K) * tan(elevation * K));
  Ip_Ss = if I_Ss < 0 then 0 else if elevation <0 then 0 else I_Ss;
  I_Sw = I_dir * (cos(90 * K) + cos(abs(azimuth * K - 270 * K)) * sin(90 * K) * tan(elevation * K));
  Ip_Sw = if I_Sw < 0 then 0 else if elevation <0 then 0 else I_Sw;
  I_Sre = I_dir * (cos(45 * K) + cos(abs(azimuth * K - 90 * K)) * sin(45 * K) * tan(elevation * K));
  Ip_Sre = if I_Sre < 0 then 0 else if elevation <0 then 0 else I_Sre;
  I_Srw = I_dir * (cos(45 * K) + cos(abs(azimuth * K - 270 * K)) * sin(45 * K) * tan(elevation * K));
  Ip_Srw = if I_Srw < 0 then 0 else if elevation <0 then 0 else I_Srw;

  
  Q_Sn  = Ip_Sn*Sn.A;
  Q_Se  = Ip_Se*Se.A;
  Q_Ss  = Ip_Ss*Ss.A;
  Q_Sw  = Ip_Sw*Sw.A;
  Q_Sre = Ip_Sre*Sre.A;
  Q_Srw = Ip_Srw*Srw.A;
  
  Radiation.Q = Q_Sn+ Q_Se+ Q_Ss+ Q_Sw+ Q_Sre+ Q_Srw;


annotation(
      Icon(graphics = {Ellipse(lineColor = {255, 170, 0}, fillColor = {255, 255, 0}, fillPattern = FillPattern.Solid, lineThickness = 3, extent = {{-40, 40}, {40, -40}}, endAngle = 360), Line(origin = {0, 64.67}, points = {{0, -15}, {0, 15}}, color = {255, 170, 0}, thickness = 3), Line(origin = {0.754717, -64.9998}, points = {{0, -15}, {0, 15}}, color = {255, 170, 0}, thickness = 3), Line(origin = {52.0283, -16.6979}, points = {{28, 17}, {-2, 17}}, color = {255, 170, 0}, thickness = 3), Line(origin = {-77.9717, -17.9243}, points = {{28, 17}, {-2, 17}}, color = {255, 170, 0}, thickness = 3), Line(origin = {-67.9717, 22.1229}, points = {{30, 15}, {8, 37}}, color = {255, 170, 0}, thickness = 3), Line(origin = {29.8585, -74.8582}, points = {{30, 15}, {8, 37}}, color = {255, 170, 0}, thickness = 3), Line(origin = {29.6227, 44.7644}, points = {{30, 15}, {8, -7}}, color = {255, 170, 0}, thickness = 3), Line(origin = {-67.3584, -52.8771}, points = {{30, 15}, {8, -7}}, color = {255, 170, 0}, thickness = 3)}));
  
end Sun;
