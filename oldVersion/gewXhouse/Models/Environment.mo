within gewXhouse.Models;

model Environment
  parameter String filePath = "C:/gewXhouse/gewXhouse/Resources/temp.txt";
  //parameter String filePath = "C:/Users/m.jilg.LOCCIONI/Documents/GitHub/gewXhouse/gewXhouse/Resources/temp.txt";
  Modelica.Blocks.Sources.CombiTimeTable temperature(extrapolation = Modelica.Blocks.Types.Extrapolation.HoldLastPoint, fileName = filePath, offset = {0}, smoothness = Modelica.Blocks.Types.Smoothness.LinearSegments, startTime = 1, table = fill(0.0, 0, 2), tableName = "temp", tableOnFile = true, timeScale = 60, verboseRead = true) annotation(
    Placement(visible = true, transformation(origin = {-50, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Thermal.HeatTransfer.Celsius.PrescribedTemperature prescribedTemperature annotation(
    Placement(visible = true, transformation(origin = {0, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_a air annotation(
    Placement(visible = true, transformation(origin = {50, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {70, 24}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  //algorithm
  //  environment.T := toKelvin.Kelvin;
  Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_a floor annotation(
    Placement(visible = true, transformation(origin = {50, -24}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {70, -26}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Thermal.HeatTransfer.Celsius.FixedTemperature fixedTemperature(T = 10)  annotation(
    Placement(visible = true, transformation(origin = {0, -24}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(fixedTemperature.port, floor) annotation(
    Line(points = {{10, -24}, {50, -24}}, color = {191, 0, 0}));
  connect(air, prescribedTemperature.port) annotation(
    Line(points = {{50, 10}, {10, 10}}, color = {191, 0, 0}));
  connect(prescribedTemperature.T, temperature.y[1]) annotation(
    Line(points = {{-12, 10}, {-38, 10}}, color = {0, 0, 127}));
  annotation(
      Icon(coordinateSystem(initialScale = 0.1), graphics = {Rectangle(fillColor = {255, 255, 255}, pattern = LinePattern.None, fillPattern = FillPattern.Solid, extent = {{-80, 40}, {62, -40}}),Line(origin = {0.96813, 5.89242}, points = {{-39.934, -0.80248}, {-21.934, 5.19752}, {0.0659595, -0.802482}, {18.066, 3.19752}, {40.066, -2.80248}}, color = {85, 85, 255}, thickness = 1, smooth = Smooth.Bezier), Line(origin = {1.05813, -4.24758}, points = {{-39.934, -0.80248}, {-21.934, 5.19752}, {0.0659595, -0.802482}, {18.066, 3.19752}, {40.066, -2.80248}}, color = {85, 85, 255}, thickness = 1, smooth = Smooth.Bezier)}),
    experiment(StartTime = 0, StopTime = 86400, Tolerance = 1e-06, Interval = 86.5731));

end Environment;
