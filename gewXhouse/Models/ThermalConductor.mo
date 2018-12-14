within gewXhouse.Models;

model ThermalConductor  extends Modelica.Thermal.HeatTransfer.Interfaces.Element1D;
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
This is a standard modelica model for transport of heat without storing it; see also:
<a href=\"modelica://Modelica.Thermal.HeatTransfer.Components.ThermalResistor\">ThermalResistor</a>.</p><p>The conductor calculates delta temperature with  <a href=\"modelica://Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_a\" style=\"font-size: 12px;\">heat port</a>&nbsp;(tempetures a - temperature b) and multiplies it with a constant thermal conductance of a material - G. The result is a heat flux ( Q-Flow), which will be tranfered to the inner components of the greenhouse.</p>




</body></html>"),
    experiment(StartTime = 0, StopTime = 86400, Tolerance = 1e-06, Interval = 86.5731));
end ThermalConductor;
