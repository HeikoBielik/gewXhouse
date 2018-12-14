within gewXhouse.Models;

model ThermalConductor "Lumped thermal element transporting heat without storing it"
  extends Modelica.Thermal.HeatTransfer.Interfaces.Element1D;
  Modelica.Blocks.Interfaces.RealInput G "W/K" annotation(
    Placement(visible = true, transformation(origin = {0, 100}, extent = {{-20, -20}, {20, 20}}, rotation = -90), iconTransformation(origin = {0, -80}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  //Modelica.SIunits.ThermalConductance G "Constant thermal conductance of material";
equation
//G = G_in;
  Q_flow = G * dT;
  annotation(
    Icon(coordinateSystem(initialScale = 0.1), graphics = {Rectangle(fillColor = {192, 192, 192}, pattern = LinePattern.None, fillPattern = FillPattern.Backward, extent = {{-90, 70}, {90, -70}}), Line(points = {{-90, 70}, {-90, -70}}, thickness = 0.5), Line(points = {{90, 70}, {90, -70}}, thickness = 0.5), Text(lineColor = {0, 0, 255}, extent = {{-150, 115}, {150, 75}}, textString = "%name")}),
    Diagram(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}), graphics = {Line(points = {{-80, 0}, {80, 0}}, color = {255, 0, 0}, thickness = 0.5, arrow = {Arrow.None, Arrow.Filled}), Text(extent = {{-100, -20}, {100, -40}}, lineColor = {255, 0, 0}, textString = "Q_flow"), Text(extent = {{-100, 40}, {100, 20}}, lineColor = {0, 0, 0}, textString = "dT = port_a.T - port_b.T")}),
    Documentation(info = "<html><head></head><body>


<p>
This is a model for transport of heat without storing it; see also:
<a href=\"modelica://Modelica.Thermal.HeatTransfer.Components.ThermalResistor\">ThermalResistor</a>. It is a generic model for the heat capacity of a material.
No specific geometry is assumed beyond a total volume with
uniform temperature for the entire volume. The specific data &nbsp;for the thermal conductor calculation is provided by the inputs from the user and outputs the Q_flow ( heat flow) in the heat port.</p><p>Overview of the thermal conductor&nbsp;</p>


<table style=\"height: 200px; width: 574px; border-color: black; margin-left: auto; margin-right: auto;\" border=\"1\">
<tbody>
<tr style=\"height: 39px;\">
<td style=\"width: 79.1333px; text-align: center; height: 39px;\">&nbsp;</td>
<td style=\"width: 198.917px; height: 39px; text-align: center;\"><strong>Variable</strong></td>
<td style=\"width: 271.95px; height: 39px; text-align: center;\"><strong>Description</strong></td>
</tr>
<tr style=\"height: 38px;\">
<td style=\"width: 79.1333px; text-align: center; height: 100px;\" rowspan=\"3\"><img src=\"modelica://gewXhouse/Resources/Input.jpg\" alt=\"Smiley face\" width=\"45\" height=\"42\"><strong>Input</strong></td>
<td style=\"width: 198.917px; height: 38px; text-align: center;\">Volume</td>
<td style=\"width: 271.95px; height: 38px; text-align: center;\">Volume of the house</td>
</tr>
<tr style=\"height: 29px;\">
<td style=\"width: 198.917px; height: 29px; text-align: center;\">rho</td>
<td style=\"width: 271.95px; height: 29px; text-align: center;\">specific denisity</td>
</tr>
<tr style=\"height: 33px;\">
<td style=\"width: 198.917px; height: 33px; text-align: center;\">c_p</td>
<td style=\"width: 271.95px; height: 33px; text-align: center;\">specific thermal capacity of the floor</td>
</tr>
<tr style=\"height: 33px;\">
<td style=\"width: 79.1333px; text-align: center; height: 33px;\"><img src=\"modelica://gewXhouse/Resources/Output.jpg\" alt=\"Smiley face\" width=\"42\" height=\"42\"><strong>Output</strong></td>
<td style=\"width: 198.917px; height: 33px;\">
<p style=\"text-align: center;\">heat Port [b]</p>
</td>
<td style=\"width: 271.95px; height: 33px; text-align: center;\">The heat port transfers the Q_flow inner the greenhouse</td>
</tr>
</tbody>
</table>
<p>&nbsp;</p>




</body></html>"),
    experiment(StartTime = 0, StopTime = 86400, Tolerance = 1e-06, Interval = 86.5731));
end ThermalConductor;
