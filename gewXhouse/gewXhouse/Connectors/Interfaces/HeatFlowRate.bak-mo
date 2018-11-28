within gewXhouse.Connectors.Interfaces;
connector HeatFlowRate
  "Thermal port for 1-dim. heat transfer (filled rectangular icon)"

  extends Modelica.Thermal.HeatTransfer.Interfaces.HeatPort;

  annotation(defaultComponentName = "port_a",
    Documentation(info="<html>
<p>This connector is used for 1-dimensional heat flow between components.
The variables in the connector are:</p>
<pre>
T       Temperature in [Kelvin].
Q_flow  Heat flow rate in [Watt].
</pre>
<p>According to the Modelica sign convention, a <b>positive</b> heat flow
rate <b>Q_flow</b> is considered to flow <b>into</b> a component. This
convention has to be used whenever this connector is used in a model
class.</p>
<p>Note, that the two connector classes <b>HeatPort_a</b> and
<b>HeatPort_b</b> are identical with the only exception of the different
<b>icon layout</b>.</p></html>"),     Icon(coordinateSystem(initialScale = 0.1), graphics={Rectangle(lineColor = {170, 0, 0}, fillColor = {170, 85, 0}, fillPattern = FillPattern.Solid, extent = {{-100, 100}, {100, -100}})}),
    Diagram(coordinateSystem(initialScale = 0.1), graphics={Rectangle(lineColor = {170, 0, 0}, fillColor = {170, 85, 0}, fillPattern = FillPattern.Solid, extent = {{-50, 50}, {50, -50}}), Text(origin = {10, -10}, lineColor = {191, 0, 0}, extent = {{-120, 120}, {100, 60}}, textString = "%name")}));
end HeatFlowRate;
