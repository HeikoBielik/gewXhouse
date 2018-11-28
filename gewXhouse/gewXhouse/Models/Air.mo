within gewXhouse.Models;

model Air
  /******************** Parameters ********************/
  parameter Modelica.SIunits.Density rho = 1.2;
  parameter Modelica.SIunits.SpecificHeatCapacity c_p = 1e3;
  /******************** Variables ********************/
  Modelica.SIunits.HeatFlowRate Q_flow "Heat flow rate from port_a -> port_b";
  Modelica.SIunits.Temperature T;
  Modelica.SIunits.Mass m "kg";
  Modelica.SIunits.HeatCapacity C "J/K";
  /******************** Connectors ********************/
  Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_a heatPort "Heat port for sensible heat input" annotation(
    Placement(visible = true,transformation(extent = {{-32, -10}, {-12, 10}}, rotation = 0), iconTransformation(extent = {{-10, 40}, {10, 60}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput volumeHouse annotation(
    Placement(visible = true, transformation(origin = {-32, -38}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-40, -56}, extent = {{10, -10}, {-10, 10}}, rotation = -90)));
equation
  m = rho * volumeHouse;
  C = m * c_p;
  der(T) = Q_flow / C;
// Balance on the floor
  heatPort.T = T;
  heatPort.Q_flow = Q_flow;
  annotation(
    Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics),
    Icon(coordinateSystem(preserveAspectRatio = false, initialScale = 0.1), graphics = {Text(extent = {{-110, -54}, {110, -114}}, textString = "%name"), Ellipse(lineColor = {0, 0, 255}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, extent = {{-60, 60}, {60, -60}}, endAngle = 360)}));
end Air;
