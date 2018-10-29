within gewXhouse.Models;

model Environment

  Modelica.Blocks.Sources.CombiTimeTable temperature( extrapolation = Modelica.Blocks.Types.Extrapolation.HoldLastPoint,fileName = "C:/Users/marcel.franzke/Dropbox/gewXhouse/temp.txt", offset = {0}, smoothness = Modelica.Blocks.Types.Smoothness.LinearSegments, startTime = 1, table = fill(0.0, 0, 2), tableName = "temp", tableOnFile = true, timeScale = 60, verboseRead = true)  annotation(
    Placement(visible = true, transformation(origin = {-50, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
Modelica.Thermal.HeatTransfer.Celsius.ToKelvin toKelvin1 annotation(
    Placement(visible = true, transformation(origin = {-14, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(toKelvin1.Celsius, temperature.y[1]) annotation(
    Line(points = {{-26, 70}, {-16, 70}, {-16, 70}, {-38, 70}, {-38, 70}}, color = {0, 0, 127}));



annotation(
      Icon(graphics = {Line(origin = {-0.23, -84.2968}, points = {{-98.4671, -1.98624}, {-72.4671, 2.01376}, {-44.4671, -5.98624}, {7.53292, 4.01376}, {43.5329, -3.98624}, {69.5329, 2.01376}, {97.5329, -3.98624}}, color = {85, 85, 0}, thickness = 6, smooth = Smooth.Bezier), Line(origin = {49.0979, 88.3132}, points = {{-39.934, -0.80248}, {-21.934, 5.19752}, {0.0659595, -0.802482}, {18.066, 3.19752}, {40.066, -2.80248}}, color = {85, 85, 255}, thickness = 3, smooth = Smooth.Bezier), Line(origin = {48.8621, 78.1717}, points = {{-39.934, -0.80248}, {-21.934, 5.19752}, {0.0659595, -0.802482}, {18.066, 3.19752}, {40.066, -2.80248}}, color = {85, 85, 255}, thickness = 3, smooth = Smooth.Bezier), Line(origin = {0.13, 4.2}, points = {{-59.9906, -57.1231}, {-79.9906, -41.1231}, {-79.9906, 38.8769}, {-59.9906, 58.8769}, {60.0094, 58.8769}, {80.0094, 38.8769}, {80.0094, -41.1231}, {60.0094, -61.1231}, {-37.9906, -61.1231}}, color = {255, 85, 255}, thickness = 5, arrow = {Arrow.None, Arrow.Filled}, arrowSize = 25, smooth = Smooth.Bezier)}));

end Environment;