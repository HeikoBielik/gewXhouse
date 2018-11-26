within gewXhouse.Models;

model Environment


  Modelica.Blocks.Sources.CombiTimeTable temperature( extrapolation = Modelica.Blocks.Types.Extrapolation.HoldLastPoint,fileName = "C:/Users/m.jilg.LOCCIONI/Documents/OpenModelica/Projekte/gewXhouse/gewXhouse/Resources/temp.txt", offset = {0}, smoothness = Modelica.Blocks.Types.Smoothness.LinearSegments, startTime = 1, table = fill(0.0, 0, 2), tableName = "temp", tableOnFile = true, timeScale = 60, verboseRead = true)  annotation(
    Placement(visible = true, transformation(origin = {-50, 34}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  gewXhouse.Connectors.environment environment annotation(
    Placement(visible = true, transformation(origin = {40, 34}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {80, -3.55271e-15}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
environment.T = temperature.y[1];
  annotation(
      Icon(coordinateSystem(initialScale = 0.1), graphics = {Line(origin = {0.96813, 5.89242}, points = {{-39.934, -0.80248}, {-21.934, 5.19752}, {0.0659595, -0.802482}, {18.066, 3.19752}, {40.066, -2.80248}}, color = {85, 85, 255}, thickness = 1, smooth = Smooth.Bezier), Line(origin = {1.05813, -4.24758}, points = {{-39.934, -0.80248}, {-21.934, 5.19752}, {0.0659595, -0.802482}, {18.066, 3.19752}, {40.066, -2.80248}}, color = {85, 85, 255}, thickness = 1, smooth = Smooth.Bezier)}));

end Environment;
