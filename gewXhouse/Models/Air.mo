within gewXhouse.Models;

model Air

  parameter Modelica.Blocks.Sources.RealExpression rho (y= 1.2) "air density" annotation(
    Placement(visible = true, transformation(origin = {-50, -26}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  parameter Modelica.Blocks.Sources.RealExpression c_p (y= 1e3) "specific thermal capacity" annotation(
    Placement(visible = true, transformation(origin = {-50, -4}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  parameter Modelica.Blocks.Sources.RealExpression v (y= 30) "m3 volume house" annotation(
    Placement(visible = true, transformation(origin = {-50, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  
  Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_a port "Heat port for sensible heat input" annotation(
    Placement(visible = true, transformation(extent = {{-10, -80}, {10, -60}}, rotation = 0), iconTransformation(extent = {{-10, 40}, {10, 60}}, rotation = 0)));
  gewXhouse.Models.HeatCapacitor heatCapacitor annotation(
    Placement(visible = true, transformation(origin = {0, -7.10543e-15}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
equation
  connect(rho.y, heatCapacitor.rho) annotation(
    Line(points = {{-50, -26}, {-32, -26}, {-32, -12}, {-16, -12}, {-16, -12}}, color = {0, 0, 127}));
  connect(heatCapacitor.c_p, c_p.y) annotation(
    Line(points = {{-16, -4}, {-44, -4}, {-44, -4}, {-50, -4}}, color = {0, 0, 127}));
  connect(v.y, heatCapacitor.volume) annotation(
    Line(points = {{-50, 20}, {-38, 20}, {-38, 4}, {-16, 4}}, color = {0, 0, 127}));
  connect(port, heatCapacitor.port) annotation(
    Line(points = {{0, -70}, {0, -70}, {0, -20}, {0, -20}}, color = {191, 0, 0}));
  annotation(
    Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics),
    Icon(coordinateSystem(preserveAspectRatio = false, initialScale = 0.1), graphics = {Text(extent = {{-110, -54}, {110, -114}}, textString = "%name"), Ellipse(lineColor = {0, 0, 255}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, extent = {{-60, 60}, {60, -60}}, endAngle = 360)}),
  experiment(StartTime = 0, StopTime = 86400, Tolerance = 1e-06, Interval = 86.5731),
  Documentation(info = "<html><head></head><body><p><b>AIR MODEL</b></p><p>The air model is a component in the greenhouse, which interact with all components in the greenhouse and influesnce each other. The user is able to change the medium in the<span style=\"font-size: 12px;\">&nbsp;</span><a href=\"modelica://gewXhouse.Models.House\" style=\"font-size: 12px;\">house</a><span style=\"font-size: 12px;\">&nbsp;</span>&nbsp;model with the specific thermal capacity and density of the desired medium&nbsp;</p><p>Overview of air input/output&nbsp;</p>


<table style=\"height: 200px; width: 574px; border-color: black; margin-left: auto; margin-right: auto;\" border=\"1\">
<tbody>
<tr style=\"height: 39px;\">
<td style=\"width: 79.1333px; text-align: center; height: 39px;\">&nbsp;</td>
<td style=\"width: 198.917px; height: 39px; text-align: center;\"><strong>Variable</strong></td>
<td style=\"width: 271.95px; height: 39px; text-align: center;\"><strong>Description</strong></td>
</tr>
<tr style=\"height: 30.8px;\">
<td style=\"width: 79.1333px; text-align: center; height: 30.8px;\" rowspan=\"3\"><img src=\"modelica://gewXhouse/Resources/Input.jpg\" alt=\"Smiley face\" width=\"45\" height=\"42\"><strong>Input</strong></td>
<td style=\"width: 198.917px; height: 30.8px; text-align: center;\">V</td>
<td style=\"width: 271.95px; height: 30.8px; text-align: center;\">automatically transfer from house</td>
</tr>
<tr style=\"height: 30.8px;\">
<td style=\"width: 198.917px; height: 30.8px; text-align: center;\">c_p</td>
<td style=\"width: 271.95px; height: 30.8px; text-align: center;\">specific thermal capacity</td>
</tr>
<tr style=\"height: 30.8px;\">
<td style=\"width: 198.917px; height: 30.8px; text-align: center;\">density (rho)</td>
<td style=\"width: 271.95px; height: 30.8px; text-align: center;\">densinty of the inner greenhouse medium</td>
</tr>
<tr style=\"height: 33px;\">
<td style=\"width: 79.1333px; text-align: center; height: 33px;\"><img src=\"modelica://gewXhouse/Resources/Output.jpg\" alt=\"Smiley face\" width=\"42\" height=\"42\"><strong>Output</strong></td>
<td style=\"width: 198.917px; height: 33px;\">
<p style=\"text-align: center;\">heat Port</p>
</td>
<td style=\"width: 271.95px; height: 33px; text-align: center;\">The heat port transfers thetemperature between the different components in the inner reenhouse</td>
</tr>
</tbody>
</table>
<p>&nbsp;</p>


<p>&nbsp;</p></body></html>"));
end Air;
