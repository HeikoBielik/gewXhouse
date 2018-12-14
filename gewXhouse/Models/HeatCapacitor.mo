within gewXhouse.Models;

model HeatCapacitor "Lumped thermal element storing heat"
  Modelica.Blocks.Interfaces.RealInput rho "kg/m3 density" annotation(
    Placement(visible = true, transformation(origin = {-90, -60}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-80, -60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput c_p "specific thermal capacity" annotation(
    Placement(visible = true, transformation(origin = {-90, -20}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-80, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput volume annotation(
    Placement(visible = true, transformation(origin = {-90, 20}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-80, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.SIunits.HeatCapacity C "Heat capacity of element (= cp*m)";
  Modelica.SIunits.Temperature T(start=294.15, displayUnit = "degC") "Temperature of element";
  Modelica.SIunits.TemperatureSlope der_T(start = 0) "Time derivative of temperature (= der(T))";
  Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_a port(T(start = 293.15)) annotation(
    Placement(transformation(origin = {0, -100}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
equation
  C = rho * volume * c_p;
  T = port.T;
  der_T = der(T);
  C * der(T) = port.Q_flow;
  annotation(
    Placement(visible = true, transformation(origin = {-90, 20}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-80, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)),
    Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}), graphics = {Text(extent = {{-150, 110}, {150, 70}}, textString = "%name", lineColor = {0, 0, 255}), Polygon(points = {{0, 67}, {-20, 63}, {-40, 57}, {-52, 43}, {-58, 35}, {-68, 25}, {-72, 13}, {-76, -1}, {-78, -15}, {-76, -31}, {-76, -43}, {-76, -53}, {-70, -65}, {-64, -73}, {-48, -77}, {-30, -83}, {-18, -83}, {-2, -85}, {8, -89}, {22, -89}, {32, -87}, {42, -81}, {54, -75}, {56, -73}, {66, -61}, {68, -53}, {70, -51}, {72, -35}, {76, -21}, {78, -13}, {78, 3}, {74, 15}, {66, 25}, {54, 33}, {44, 41}, {36, 57}, {26, 65}, {0, 67}}, lineColor = {160, 160, 164}, fillColor = {192, 192, 192}, fillPattern = FillPattern.Solid), Polygon(points = {{-58, 35}, {-68, 25}, {-72, 13}, {-76, -1}, {-78, -15}, {-76, -31}, {-76, -43}, {-76, -53}, {-70, -65}, {-64, -73}, {-48, -77}, {-30, -83}, {-18, -83}, {-2, -85}, {8, -89}, {22, -89}, {32, -87}, {42, -81}, {54, -75}, {42, -77}, {40, -77}, {30, -79}, {20, -81}, {18, -81}, {10, -81}, {2, -77}, {-12, -73}, {-22, -73}, {-30, -71}, {-40, -65}, {-50, -55}, {-56, -43}, {-58, -35}, {-58, -25}, {-60, -13}, {-60, -5}, {-60, 7}, {-58, 17}, {-56, 19}, {-52, 27}, {-48, 35}, {-44, 45}, {-40, 57}, {-58, 35}}, lineColor = {0, 0, 0}, fillColor = {160, 160, 164}, fillPattern = FillPattern.Solid), Text(extent = {{-69, 7}, {71, -24}}, lineColor = {0, 0, 0}, textString = "%C")}),
    Diagram(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}), graphics = {Polygon(points = {{0, 67}, {-20, 63}, {-40, 57}, {-52, 43}, {-58, 35}, {-68, 25}, {-72, 13}, {-76, -1}, {-78, -15}, {-76, -31}, {-76, -43}, {-76, -53}, {-70, -65}, {-64, -73}, {-48, -77}, {-30, -83}, {-18, -83}, {-2, -85}, {8, -89}, {22, -89}, {32, -87}, {42, -81}, {54, -75}, {56, -73}, {66, -61}, {68, -53}, {70, -51}, {72, -35}, {76, -21}, {78, -13}, {78, 3}, {74, 15}, {66, 25}, {54, 33}, {44, 41}, {36, 57}, {26, 65}, {0, 67}}, lineColor = {160, 160, 164}, fillColor = {192, 192, 192}, fillPattern = FillPattern.Solid), Polygon(points = {{-58, 35}, {-68, 25}, {-72, 13}, {-76, -1}, {-78, -15}, {-76, -31}, {-76, -43}, {-76, -53}, {-70, -65}, {-64, -73}, {-48, -77}, {-30, -83}, {-18, -83}, {-2, -85}, {8, -89}, {22, -89}, {32, -87}, {42, -81}, {54, -75}, {42, -77}, {40, -77}, {30, -79}, {20, -81}, {18, -81}, {10, -81}, {2, -77}, {-12, -73}, {-22, -73}, {-30, -71}, {-40, -65}, {-50, -55}, {-56, -43}, {-58, -35}, {-58, -25}, {-60, -13}, {-60, -5}, {-60, 7}, {-58, 17}, {-56, 19}, {-52, 27}, {-48, 35}, {-44, 45}, {-40, 57}, {-58, 35}}, lineColor = {0, 0, 0}, fillColor = {160, 160, 164}, fillPattern = FillPattern.Solid), Ellipse(extent = {{-6, -1}, {6, -12}}, lineColor = {255, 0, 0}, fillColor = {191, 0, 0}, fillPattern = FillPattern.Solid), Text(extent = {{11, 13}, {50, -25}}, lineColor = {0, 0, 0}, textString = "T"), Line(points = {{0, -12}, {0, -96}}, color = {255, 0, 0})}),
    Documentation(info = "<html><head></head><body><p style=\"font-size: 12px;\">This is a generic modelica model for the&nbsp;<a href=\"modelica://Modelica.Thermal.HeatTransfer.Components.HeatCapacitor\" style=\"font-size: 12px;\">heat capacity</a> of a material, which was adapted to the greenhouse input. The heat capacity gets RealInput house-volume, density specifiic thermal capactity and the &nbsp;of the house to calcute the mass.&nbsp;</p><p style=\"font-size: 12px;\">Moreover to this model has been added a thermal standard modelica <a href=\"modelica://Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_a\" style=\"font-size: 12px;\">heat port</a>, which transfers the heat flux and the temperature between inner components of the greenhouse.</p>
<p style=\"font-size: 12px;\">Overview of Input/Output heat capacitor</p>


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
<td style=\"width: 271.95px; height: 38px; text-align: center;\">volume of the house</td>
</tr>
<tr style=\"height: 29px;\">
<td style=\"width: 198.917px; height: 29px; text-align: center;\">rho</td>
<td style=\"width: 271.95px; height: 29px; text-align: center;\">density of the inner house medium</td>
</tr>
<tr style=\"height: 33px;\">
<td style=\"width: 198.917px; height: 33px; text-align: center;\">c_p</td>
<td style=\"width: 271.95px; height: 33px; text-align: center;\">specific thermal capacity</td>
</tr>
<tr style=\"height: 33px;\">
<td style=\"width: 79.1333px; text-align: center; height: 33px;\"><img src=\"modelica://gewXhouse/Resources/Output.jpg\" alt=\"Smiley face\" width=\"42\" height=\"42\"><strong>Output</strong></td>
<td style=\"width: 198.917px; height: 33px;\">
<p style=\"text-align: center;\">heat Port</p>
</td>
<td style=\"width: 271.95px; height: 33px; text-align: center;\">heat port transfers the inner heat flux and temperature the greenhouse</td>
</tr>
</tbody>
</table>
<p>&nbsp;</p>

</body></html>"));
end HeatCapacitor;
