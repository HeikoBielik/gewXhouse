within gewXhouse.Models;

model Environment
  parameter String data_air="temp.txt" "Air temperature table name in resources folder";
  parameter String data_floor="temp_floor.txt" "Floor temperature table name in resources folder";
  final parameter String filePath_temp = gewXhouse.Resources.Data.LibrarySystemPath + data_air;
  final parameter String filePath_temp_floor =  gewXhouse.Resources.Data.LibrarySystemPath + data_floor;
  //parameter String filePath = "C:/Users/m.jilg.LOCCIONI/Documents/GitHub/gewXhouse/gewXhouse/Resources/temp.txt";
  Modelica.Blocks.Sources.CombiTimeTable temperature_air(extrapolation = Modelica.Blocks.Types.Extrapolation.HoldLastPoint, fileName = filePath_temp, offset = {0}, smoothness = Modelica.Blocks.Types.Smoothness.LinearSegments, startTime = 1, table = fill(0.0, 0, 2), tableName = "temp", tableOnFile = true, timeScale = 60, verboseRead = true) annotation(
    Placement(visible = true, transformation(origin = {-50, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Thermal.HeatTransfer.Celsius.PrescribedTemperature prescribedTemperature annotation(
    Placement(visible = true, transformation(origin = {0, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_a air annotation(
    Placement(visible = true, transformation(origin = {50, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {70, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  //algorithm
  //  environment.T := toKelvin.Kelvin;
  Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_a floor annotation(
    Placement(visible = true, transformation(origin = {50, -28}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {70, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  
  Modelica.Blocks.Sources.CombiTimeTable temperatur_floor(extrapolation = Modelica.Blocks.Types.Extrapolation.HoldLastPoint, fileName = filePath_temp_floor, offset = {0}, smoothness = Modelica.Blocks.Types.Smoothness.LinearSegments, startTime = 1, table = fill(0.0, 0, 2), tableName = "temp_floor", tableOnFile = true, timeScale = 3600, verboseRead = true) annotation(
    Placement(visible = true, transformation(origin = {-50, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Thermal.HeatTransfer.Celsius.PrescribedTemperature prescribedTemperature1 annotation(
    Placement(visible = true, transformation(origin = {30, -28}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Logical.Switch switch1 annotation(
    Placement(visible = true, transformation(origin = {0, -28}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression fix_temperature_floor annotation(
    Placement(visible = true, transformation(origin = {-50, -60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.BooleanExpression variable(y = true)  annotation(
    Placement(visible = true, transformation(origin = {-50, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(temperatur_floor.y[1], switch1.u1) annotation(
    Line(points = {{-38, -20}, {-12, -20}, {-12, -20}, {-12, -20}}, color = {0, 0, 127}, thickness = 0.5));
  connect(temperature_air.y[1], prescribedTemperature.T) annotation(
    Line(points = {{-38, 10}, {-12, 10}, {-12, 10}, {-12, 10}}, color = {0, 0, 127}, thickness = 0.5));
  connect(fix_temperature_floor.y, switch1.u3) annotation(
    Line(points = {{-38, -60}, {-26, -60}, {-26, -36}, {-12, -36}, {-12, -36}}, color = {0, 0, 127}));
  connect(variable.y, switch1.u2) annotation(
    Line(points = {{-38, -40}, {-34, -40}, {-34, -28}, {-12, -28}, {-12, -28}}, color = {255, 0, 255}));
  connect(prescribedTemperature1.T, switch1.y) annotation(
    Line(points = {{18, -28}, {16, -28}, {16, -28}, {14, -28}, {14, -28}, {12, -28}, {12, -28}, {12, -28}, {12, -29}, {12, -29}, {12, -28}}, color = {0, 0, 127}));
  connect(prescribedTemperature1.port, floor) annotation(
    Line(points = {{40, -28}, {45, -28}, {45, -28}, {50, -28}, {50, -28}, {50, -28}, {50, -28}, {50, -28}}, color = {191, 0, 0}));
  connect(air, prescribedTemperature.port) annotation(
    Line(points = {{50, 10}, {10, 10}}, color = {191, 0, 0}));
  
  annotation(
    defaultComponentName = "environment",
    Icon(coordinateSystem(initialScale = 0.1), graphics = {Rectangle(fillColor = {255, 255, 255}, pattern = LinePattern.None, fillPattern = FillPattern.Solid, extent = {{-80, 40}, {62, -40}}),Text(origin = {0, -4}, lineColor = {190, 0, 0}, extent = {{-180, -28}, {180, -60}}, textString = "%name"), Line(origin = {0.96813, 5.89242}, points = {{-39.934, -0.80248}, {-21.934, 5.19752}, {0.0659595, -0.802482}, {18.066, 3.19752}, {40.066, -2.80248}}, color = {85, 85, 255}, thickness = 1, smooth = Smooth.Bezier), Line(origin = {1.05813, -4.24758}, points = {{-39.934, -0.80248}, {-21.934, 5.19752}, {0.0659595, -0.802482}, {18.066, 3.19752}, {40.066, -2.80248}}, color = {85, 85, 255}, thickness = 1, smooth = Smooth.Bezier)}),
    experiment(StartTime = 0, StopTime = 86400, Tolerance = 1e-06, Interval = 86.5731),
  Documentation(info = "<html><head></head><body><p><b>ENVIRONMENT MODEL</b></p><p>The environment model is a component, which connects the environment with the greenhouse. The user user has the possibility to read in the temperature outside and floor temperature with a modelica standdard Block&nbsp;<a href=\"modelica://Modelica.Blocks.Sources.CombiTimeTable\" style=\"font-size: 12px;\">combi timetable</a>. Moreover, the user can decide with a <a href=\"modelica://Modelica.Blocks.Logical.Switch\">switch</a>, if the ground environment temperature should be considered in the simulation.</p><p>Overview of environment input/output&nbsp;</p>


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
<p style=\"text-align: center;\">heat Port _air</p>
</td>
<td style=\"width: 271.95px; height: 33px; text-align: center;\">connects the environment air temperature with the air house temperature</td>
</tr>
<tr style=\"height: 33px;\">
<td style=\"width: 198.917px; height: 33px;\">
<p style=\"text-align: center;\">heat Port_floor</p>
</td>
<td style=\"width: 271.95px; height: 33px; text-align: center;\">connects the house floor temperature with the ennvironment floor temperature</td>
</tr>
</tbody>
</table>
<p>&nbsp;</p>


<p>&nbsp;</p></body></html>"));
end Environment;
