within gewXhouse.Models;

model Radiation
  "Variable temperature boundary condition in Kelvin"
  Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_b port annotation(
    Placement(visible = true, transformation(origin = {100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput S "m2 surface"annotation(
    Placement(visible = true, transformation(origin = {-42, 28}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-28, 60}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput I annotation(
    Placement(visible = true, transformation(origin = {-42, -6}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-28, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Thermal.HeatTransfer.Sources.PrescribedHeatFlow prescribedHeatFlow annotation(
    Placement(visible = true, transformation(origin = {54, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
equation
  connect(prescribedHeatFlow.port, port) annotation(
    Line(points = {{74, 0}, {102, 0}, {102, 0}, {100, 0}}, color = {191, 0, 0}));
  prescribedHeatFlow.Q_flow = I * S;

  annotation (
    Icon(coordinateSystem(initialScale = 0.1), graphics={Rectangle(fillColor = {159, 159, 223}, pattern = LinePattern.None, fillPattern = FillPattern.Backward, extent = {{-8, 100}, {100, -100}}), Line(points = {{-10, 0}, {64, 0}}, color = {191, 0, 0}, thickness = 0.5), Text(lineColor = {0, 0, 255}, extent = {{-150, 150}, {150, 110}}, textString = "%name"), Polygon(lineColor = {191, 0, 0}, fillColor = {191, 0, 0}, fillPattern = FillPattern.Solid, points = {{50, -20}, {50, 20}, {90, 0}, {50, -20}})}),
    Documentation(info= "<html><head></head><body><p>The genereal modelica model <a href=\"modelica://Modelica.Thermal.HeatTransfer.Sources.PrescribedHeatFlow\">prescribed HeatFlow</a>&nbsp;has been adapted to the greenhouse model. The models get the inputs radiation I and the surface of the greenhouse. The prescirbed HeatFlow calculates the surfaces radiation and transfers with a <a href=\"modelica://Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_a\" style=\"font-size: 12px;\">heat port</a> the inner components of the greenhouse.&nbsp;</p><p><br></p><p>Overview Input/Output Radiation</p>

<table style=\"height: 200px; width: 574px; border-color: black; margin-left: auto; margin-right: auto;\" border=\"1\">
<tbody>
<tr style=\"height: 39px;\">
<td style=\"width: 79.1333px; text-align: center; height: 39px;\">&nbsp;</td>
<td style=\"width: 198.917px; height: 39px; text-align: center;\"><strong>Variable</strong></td>
<td style=\"width: 271.95px; height: 39px; text-align: center;\"><strong>Description</strong></td>
</tr>
<tr style=\"height: 47px;\">
<td style=\"width: 79.1333px; text-align: center; height: 92px;\" rowspan=\"2\"><img src=\"modelica://gewXhouse/Resources/Input.jpg\" alt=\"Smiley face\" width=\"45\" height=\"42\" /><strong>Input</strong></td>
<td style=\"width: 198.917px; height: 47px; text-align: center;\">S</td>
<td style=\"width: 271.95px; height: 47px; text-align: center;\">surface of the floor</td>
</tr>
<tr style=\"height: 45px;\">
<td style=\"width: 198.917px; height: 45px; text-align: center;\">&nbsp;I&nbsp;</td>
<td style=\"width: 271.95px; height: 45px; text-align: center;\">solar radiation&nbsp;</td>
</tr>
<tr style=\"height: 33px;\">
<td style=\"width: 79.1333px; text-align: center; height: 33px;\"><img src=\"modelica://gewXhouse/Resources/Output.jpg\" alt=\"Smiley face\" width=\"42\" height=\"42\" /><strong>Output</strong></td>
<td style=\"width: 198.917px; height: 33px;\">
<p style=\"text-align: center;\">port</p>
</td>
<td style=\"width: 271.95px; height: 33px; text-align: center;\">The port transfers the Q_flow to inner components of the greenhouse</td>
</tr>
</tbody>
</table>
<p>&nbsp;</p>

</body></html>"),     Diagram(coordinateSystem(initialScale = 0.1), graphics={Rectangle(fillColor = {159, 159, 223}, pattern = LinePattern.None, fillPattern = FillPattern.Backward, extent = {{0, 100}, {100, -100}}), Text(extent = {{0, 0}, {-100, -100}}, textString = "K")}),
  experiment(StartTime = 0, StopTime = 86400, Tolerance = 1e-06, Interval = 86.5731));
end Radiation;
