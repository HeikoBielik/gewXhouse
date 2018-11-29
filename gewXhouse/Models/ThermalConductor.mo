within gewXhouse.Models;
model ThermalConductor
  "Lumped thermal element transporting heat without storing it"
  extends Modelica.Thermal.HeatTransfer.Interfaces.Element1D;
  Modelica.Blocks.Interfaces.RealInput G "glass W/K" annotation(
    Placement(visible = true, transformation(origin = {0, 100}, extent = {{-20, -20}, {20, 20}}, rotation = -90), iconTransformation(origin = {0, -80}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));

  //Modelica.SIunits.ThermalConductance G "Constant thermal conductance of material";

equation
  //G = G_in;
  Q_flow = G*dT;
  annotation (
    Icon(coordinateSystem(initialScale = 0.1), graphics={Rectangle(fillColor = {192, 192, 192}, pattern = LinePattern.None, fillPattern = FillPattern.Backward, extent = {{-90, 70}, {90, -70}}), Line(points = {{-90, 70}, {-90, -70}}, thickness = 0.5), Line(points = {{90, 70}, {90, -70}}, thickness = 0.5), Text(lineColor = {0, 0, 255}, extent = {{-150, 115}, {150, 75}}, textString = "%name")}),
    Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},
            {100,100}}), graphics={
        Line(
          points={{-80,0},{80,0}},
          color={255,0,0},
          thickness=0.5,
          arrow={Arrow.None,Arrow.Filled}),
        Text(
          extent={{-100,-20},{100,-40}},
          lineColor={255,0,0},
          textString="Q_flow"),
        Text(
          extent={{-100,40},{100,20}},
          lineColor={0,0,0},
          textString="dT = port_a.T - port_b.T")}),
    Documentation(info="<html>
<p>
This is a model for transport of heat without storing it; see also:
<a href=\"modelica://Modelica.Thermal.HeatTransfer.Components.ThermalResistor\">ThermalResistor</a>.
It may be used for complicated geometries where
the thermal conductance G (= inverse of thermal resistance)
is determined by measurements and is assumed to be constant
over the range of operations. If the component consists mainly of
one type of material and a regular geometry, it may be calculated,
e.g., with one of the following equations:
</p>
<ul>
<li><p>
Conductance for a <b>box</b> geometry under the assumption
that heat flows along the box length:</p>
<pre>
G = k*A/L
k: Thermal conductivity (material constant)
A: Area of box
L: Length of box
</pre>
</li>
<li><p>
Conductance for a <b>cylindrical</b> geometry under the assumption
that heat flows from the inside to the outside radius
of the cylinder:</p>
<pre>
G = 2*pi*k*L/log(r_out/r_in)
pi   : Modelica.Constants.pi
k    : Thermal conductivity (material constant)
L    : Length of cylinder
log  : Modelica.Math.log;
r_out: Outer radius of cylinder
r_in : Inner radius of cylinder
</pre>
</li>
</ul>
<pre>
Typical values for k at 20 degC in W/(m.K):
  aluminium   220
  concrete      1
  copper      384
  iron         74
  silver      407
  steel        45 .. 15 (V2A)
  wood         0.1 ... 0.2
</pre>
</html>"),
  experiment(StartTime = 0, StopTime = 86400, Tolerance = 1e-06, Interval = 86.5731));
end ThermalConductor;
