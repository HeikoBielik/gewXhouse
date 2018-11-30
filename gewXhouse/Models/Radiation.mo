within gewXhouse.Models;

model Radiation
  "Variable temperature boundary condition in Kelvin"

  Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_b port annotation(
    Placement(visible = true, transformation(origin = {100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  parameter Modelica.Blocks.Interfaces.RealInput S = 15 annotation(
    Placement(visible = true, transformation(origin = {-20, 60}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-28, 60}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  parameter gewXhouse.Connectors.Interfaces.HeatFluxInput I = 1000 annotation(
    Placement(visible = true, transformation(origin = {-20, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-28, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
equation
  port.Q_flow = -I * S;
  annotation (
    Icon(coordinateSystem(initialScale = 0.1), graphics={Rectangle(fillColor = {159, 159, 223}, pattern = LinePattern.None, fillPattern = FillPattern.Backward, extent = {{-8, 100}, {100, -100}}), Line(points = {{-10, 0}, {64, 0}}, color = {191, 0, 0}, thickness = 0.5), Text(lineColor = {0, 0, 255}, extent = {{-150, 150}, {150, 110}}, textString = "%name"), Polygon(lineColor = {191, 0, 0}, fillColor = {191, 0, 0}, fillPattern = FillPattern.Solid, points = {{50, -20}, {50, 20}, {90, 0}, {50, -20}})}),
    Documentation(info="<html>
<p>
This model represents a variable temperature boundary condition.
The temperature in [K] is given as input signal <b>T</b>
to the model. The effect is that an instance of this model acts as
an infinite reservoir able to absorb or generate as much energy
as required to keep the temperature at the specified value.
</p>
</html>"),     Diagram(coordinateSystem(initialScale = 0.1), graphics={Rectangle(fillColor = {159, 159, 223}, pattern = LinePattern.None, fillPattern = FillPattern.Backward, extent = {{0, 100}, {100, -100}}), Text(extent = {{0, 0}, {-100, -100}}, textString = "K"), Line(points = {{-2, 0}, {64, 0}}, color = {191, 0, 0}, thickness = 0.5), Polygon(lineColor = {191, 0, 0}, fillColor = {191, 0, 0}, fillPattern = FillPattern.Solid, points = {{52, -20}, {52, 20}, {90, 0}, {52, -20}})}),
  experiment(StartTime = 0, StopTime = 86400, Tolerance = 1e-06, Interval = 86.5731));
end Radiation;
