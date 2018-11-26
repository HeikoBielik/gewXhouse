within gewXhouse.Models;

model Floor
  /******************** Parameters ********************/
  parameter Modelica.SIunits.Density rho;
  parameter Modelica.SIunits.SpecificHeatCapacity c_p;
  parameter Modelica.SIunits.Volume V;
  /******************** Initialization ********************/
  parameter Modelica.SIunits.Temperature T_start = 298 annotation(
    Dialog(tab = "Initialization"));
  parameter Boolean steadystate = false "if true, sets the derivative of T to zero during Initialization" annotation(
    Dialog(group = "Initialization options", tab = "Initialization"));
  /******************** Variables ********************/
  Modelica.SIunits.HeatFlowRate Q_flow "Heat flow rate from port_a -> port_b";
  Modelica.SIunits.Temperature T;
  Modelica.SIunits.Power P_Flr "total short-wave power to the floor";
  /******************** Connectors ********************/
  Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_a heatPort "Heat port for sensible heat input" annotation(
    Placement(transformation(extent = {{-10, -10}, {10, 10}}), iconTransformation(extent = {{-10, -10}, {10, 10}})));
  gewXhouse.Connectors.Interfaces.House house annotation(
    Placement(visible = true, transformation(origin = {-50, -70}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-70, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  gewXhouse.Connectors.Interfaces.HeatFluxInput I_Intern annotation(
    Placement(visible = true, transformation(origin = {-58, 46}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-40, 30}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
protected
equation
  Q_flow = I_Intern * house.floor.A;
// Balance on the floor
  heatPort.Q_flow = Q_flow;
  der(T) = 1 / (rho * c_p * V) * (Q_flow + P_Flr);
initial equation
  if steadystate then
    der(T) = 0;
  end if;
  annotation(
    Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics),
    Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics = {Rectangle(extent = {{-20, 80}, {20, -80}}, lineColor = {0, 0, 0}, fillColor = {192, 192, 192}, fillPattern = FillPattern.Backward, origin = {0, 0}, rotation = 90), Text(extent = {{-100, -34}, {120, -94}}, lineColor = {0, 0, 0}, textString = "%name")}));
end Floor;
