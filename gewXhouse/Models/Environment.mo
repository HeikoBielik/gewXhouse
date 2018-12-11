within gewXhouse.Models;

model Environment
  parameter String filePath = "C:/gewXhouse/gewXhouse/Resources/temp.txt";
  //parameter String filePath = "C:/Users/m.jilg.LOCCIONI/Documents/GitHub/gewXhouse/gewXhouse/Resources/temp.txt";
  Modelica.Blocks.Sources.CombiTimeTable temperature(extrapolation = Modelica.Blocks.Types.Extrapolation.HoldLastPoint, fileName = filePath, offset = {0}, smoothness = Modelica.Blocks.Types.Smoothness.LinearSegments, startTime = 1, table = fill(0.0, 0, 2), tableName = "temp", tableOnFile = true, timeScale = 60, verboseRead = true) annotation(
    Placement(visible = true, transformation(origin = {-50, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Thermal.HeatTransfer.Celsius.PrescribedTemperature prescribedTemperature annotation(
    Placement(visible = true, transformation(origin = {0, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_a air annotation(
    Placement(visible = true, transformation(origin = {50, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {70, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  //algorithm
  //  environment.T := toKelvin.Kelvin;
  Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_a floor annotation(
    Placement(visible = true, transformation(origin = {50, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {70, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Thermal.HeatTransfer.Celsius.FixedTemperature fixedTemperature(T = 21) annotation(
    Placement(visible = true, transformation(origin = {0, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(fixedTemperature.port, floor) annotation(
    Line(points = {{10, -20}, {48, -20}, {48, -20}, {50, -20}}, color = {191, 0, 0}));
  connect(air, prescribedTemperature.port) annotation(
    Line(points = {{50, 10}, {10, 10}}, color = {191, 0, 0}));
  connect(prescribedTemperature.T, temperature.y[1]) annotation(
    Line(points = {{-12, 10}, {-38, 10}}, color = {0, 0, 127}));
  annotation(
    Icon(coordinateSystem(initialScale = 0.1), graphics = {Rectangle(fillColor = {255, 255, 255}, pattern = LinePattern.None, fillPattern = FillPattern.Solid, extent = {{-80, 40}, {62, -40}}), Line(origin = {0.96813, 5.89242}, points = {{-39.934, -0.80248}, {-21.934, 5.19752}, {0.0659595, -0.802482}, {18.066, 3.19752}, {40.066, -2.80248}}, color = {85, 85, 255}, thickness = 1, smooth = Smooth.Bezier), Line(origin = {1.05813, -4.24758}, points = {{-39.934, -0.80248}, {-21.934, 5.19752}, {0.0659595, -0.802482}, {18.066, 3.19752}, {40.066, -2.80248}}, color = {85, 85, 255}, thickness = 1, smooth = Smooth.Bezier)}),
    experiment(StartTime = 0, StopTime = 86400, Tolerance = 1e-06, Interval = 86.5731),
  Documentation(info = "<html><head></head><body><p><b>ENVIRONMENT MODEL</b></p><p>The environment model is a component in the greenhouse, which which considers the environment temperature and exchange through the <a href=\"modelica://gewXhouse.Models.Cover\" style=\"font-size: 12px;\">cover</a> the heat flow and temperatues. The user user has the possibility to read the temperature outside and floor temperature with a modelica standdard Block&nbsp;<a href=\"modelica://Modelica.Blocks.Sources.CombiTimeTable\" style=\"font-size: 12px;\">combi timetable</a>.&nbsp;</p><p>Overview of environment input/output&nbsp;</p>


<table style=\"height: 200px; width: 574px; border-color: black; margin-left: auto; margin-right: auto;\" border=\"1\">
<tbody>
<tr style=\"height: 39px;\">
<td style=\"width: 79.1333px; text-align: center; height: 39px;\">&nbsp;</td>
<td style=\"width: 198.917px; height: 39px; text-align: center;\"><strong>Variable</strong></td>
<td style=\"width: 271.95px; height: 39px; text-align: center;\"><strong>Description</strong></td>
</tr>
<tr style=\"height: 30.8px;\">
<td style=\"width: 79.1333px; text-align: center; height: 30.8px;\"><img src=\"modelica://gewXhouse/Resources/Input.jpg\" alt=\"Smiley face\" width=\"45\" height=\"42\"><strong>Input</strong></td>
<td style=\"width: 198.917px; height: 30.8px; text-align: center;\">Table input</td>
<td style=\"width: 271.95px; height: 30.8px; text-align: center;\">(see<span style=\"text-align: start;\">&nbsp;</span><a href=\"modelica://Modelica.Blocks.Sources.CombiTimeTable\" style=\"font-size: 12px; text-align: start;\">combi timetable</a>)&nbsp;</td>
</tr>
<tr style=\"height: 33px;\">
<td style=\"width: 79.1333px; text-align: center; height: 66px;\" rowspan=\"2\"><img src=\"modelica://gewXhouse/Resources/Output.jpg\" alt=\"Smiley face\" width=\"42\" height=\"42\"><strong>Output</strong></td>
<td style=\"width: 198.917px; height: 33px;\">
<p style=\"text-align: center;\">heat Port _a</p>
</td>
<td style=\"width: 271.95px; height: 33px; text-align: center;\">connects the environment with the floor model and transfers the floor temperature</td>
</tr>
<tr style=\"height: 33px;\">
<td style=\"width: 198.917px; height: 33px;\">
<p style=\"text-align: center;\">prescribedtemprature</p>
</td>
<td style=\"width: 271.95px; height: 33px; text-align: center;\">connects the heat port the air model in the greenhouse</td>
</tr>
</tbody>
</table>
<p>&nbsp;</p>


<p>&nbsp;</p></body></html>"));
end Environment;
