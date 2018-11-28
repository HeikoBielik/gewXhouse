within gewXhouse.Models.Greenhouse;

model Cover
  /******************** Parameters ********************/
  parameter Modelica.SIunits.Density rho = 2600 "Cover density (glass)";
  parameter Modelica.SIunits.SpecificHeatCapacity c_p = 840 "Cover specific thermal capacity";
  parameter Modelica.SIunits.Length w = 1e-3 "Thickness of the cover";
  parameter Modelica.SIunits.ThermalConductivity lambda = 0.76 "glass W/m.K";
  /******************** Variables ********************/
  Modelica.SIunits.HeatFlowRate Q_flow "Heat flow rate from port_a -> port_b";
  Modelica.SIunits.Temperature T (start = 273.15);
  Modelica.SIunits.HeatCapacity C;
  /******************** Connectors ********************/
  Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_a heatPort "Heat port for sensible heat input" annotation(
    Placement(transformation(extent = {{-10, -10}, {10, 10}}), iconTransformation(extent = {{-10, -10}, {10, 10}})));
  gewXhouse.Connectors.Interfaces.HouseInput house annotation(
    Placement(visible = true, transformation(origin = {-64, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-70, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  gewXhouse.Connectors.environment environment annotation(
    Placement(visible = true, transformation(origin = {70, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {70, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));

equation
  C = rho * w * house.total * c_p;
  der(T) = Q_flow / C;
  Q_flow = house.total * lambda * (environment.T - T) / w;
// Balance on the cover
  heatPort.Q_flow = Q_flow;
  heatPort.T = T;
  annotation(
    Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics),
    Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics = {Rectangle(extent = {{-20, 80}, {20, -80}}, lineColor = {0, 117, 227}, fillColor = {170, 213, 255}, fillPattern = FillPattern.Backward, origin = {0, 0}, rotation = 90), Text(extent = {{-50, -34}, {170, -94}}, lineColor = {0, 0, 0}, textString = "%name")}));
end Cover;
