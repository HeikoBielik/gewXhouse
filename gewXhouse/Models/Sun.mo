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
  Real Flaechenstrahlung1 "Flächenstrahlung Seitenwand1";
  Real Flaechenstrahlung2 "Flächenstrahlung Seitenwand2";
  Real Flaechenstrahlung3 "Flächenstrahlung Seitenwand3";
  Real Flaechenstrahlung4 "Flächenstrahlung Seitenwand4";
  Real Flaechenstrahlung5 "Flächenstrahlung Dach";
  Real Flaechenstrahlung6 "Flächenstrahlung Dach";

  Real FlaechenstrahlungPositiv1;
  Real FlaechenstrahlungPositiv2;
  Real FlaechenstrahlungPositiv3;
  Real FlaechenstrahlungPositiv4;
  Real FlaechenstrahlungPositiv5;
  Real FlaechenstrahlungPositiv6;
  
  Real Direktstrahlung;
equation
  hour = time / 60 / 60;
  n = (month - 1) * 30.3 + day;
  K = pi / 180;
  m = (n - 1 + (hour - 12) / 24) / 365;
  delta = (0.006918 - 0.399912 * cos(2 * pi * m) + 0.070257 * sin(2 * pi * m) - 0.006758 * cos(4 * pi * m) + 0.000907 * sin(4 * pi * m) - 0.002697 * cos(6 * pi * m) + 0.00148 * sin(6 * pi * m)) / K;
  phi = 229.18 * (0.000075 + 0.001868 * cos(2 * pi * m) - 0.032077 * sin(2 * pi * m) - 0.014615 * cos(4 * pi * m) - 0.040849 * sin(4 * pi * m));
  omega = (hour * 60 + phi + 4 * long - 60) / 4 - 180;
  alpha = sin(K * lat) * sin(K * delta) + cos(K * lat) * cos(K * delta) * cos(K * omega);
  beta = -(sin(K * lat) * alpha - sin(K * delta)) / (cos(K * lat) * sin(acos(alpha)));
  elevation = asin(alpha) / K;
  azimuth = if der(beta) < 0 then acos(beta) / K else 360 - acos(beta) / K;
  Direktstrahlung = (-1) * 3000 + 5000 * sin(0.000035 * time);
  Flaechenstrahlung1 = Direktstrahlung * (cos(90 * K) + cos(abs(azimuth * K - 0 * K)) * sin(90 * K) * tan((if elevation < 0 then 0 else elevation) * K));
  FlaechenstrahlungPositiv1 = if Flaechenstrahlung1 < 0 then 0 else Flaechenstrahlung1;
  Flaechenstrahlung2 = Direktstrahlung * (cos(90 * K) + cos(abs(azimuth * K - 90 * K)) * sin(90 * K) * tan(elevation * K));
  FlaechenstrahlungPositiv2 = if Flaechenstrahlung2 < 0 then 0 else Flaechenstrahlung2;
  Flaechenstrahlung3 = Direktstrahlung * (cos(90 * K) + cos(abs(azimuth * K - 180 * K)) * sin(90 * K) * tan(elevation * K));
  FlaechenstrahlungPositiv3 = if Flaechenstrahlung3 < 0 then 0 else Flaechenstrahlung3;
  Flaechenstrahlung4 = Direktstrahlung * (cos(90 * K) + cos(abs(azimuth * K - 270 * K)) * sin(90 * K) * tan(elevation * K));
  FlaechenstrahlungPositiv4 = if Flaechenstrahlung4 < 0 then 0 else Flaechenstrahlung4;
  Flaechenstrahlung5 = Direktstrahlung * (cos(45 * K) + cos(abs(azimuth * K - 90 * K)) * sin(45 * K) * tan(elevation * K));
  FlaechenstrahlungPositiv5 = if Flaechenstrahlung5 < 0 then 0 else Flaechenstrahlung5;
  Flaechenstrahlung6 = Direktstrahlung * (cos(45 * K) + cos(abs(azimuth * K - 270 * K)) * sin(45 * K) * tan(elevation * K));
  FlaechenstrahlungPositiv6 = if Flaechenstrahlung6 < 0 then 0 else Flaechenstrahlung6;
  

annotation(
      Icon(graphics = {Ellipse(lineColor = {255, 170, 0}, fillColor = {255, 255, 0}, fillPattern = FillPattern.Solid, lineThickness = 3, extent = {{-40, 40}, {40, -40}}, endAngle = 360), Line(origin = {0, 64.67}, points = {{0, -15}, {0, 15}}, color = {255, 170, 0}, thickness = 3), Line(origin = {0.754717, -64.9998}, points = {{0, -15}, {0, 15}}, color = {255, 170, 0}, thickness = 3), Line(origin = {52.0283, -16.6979}, points = {{28, 17}, {-2, 17}}, color = {255, 170, 0}, thickness = 3), Line(origin = {-77.9717, -17.9243}, points = {{28, 17}, {-2, 17}}, color = {255, 170, 0}, thickness = 3), Line(origin = {-67.9717, 22.1229}, points = {{30, 15}, {8, 37}}, color = {255, 170, 0}, thickness = 3), Line(origin = {29.8585, -74.8582}, points = {{30, 15}, {8, 37}}, color = {255, 170, 0}, thickness = 3), Line(origin = {29.6227, 44.7644}, points = {{30, 15}, {8, -7}}, color = {255, 170, 0}, thickness = 3), Line(origin = {-67.3584, -52.8771}, points = {{30, 15}, {8, -7}}, color = {255, 170, 0}, thickness = 3)}));
  
end Sun;
