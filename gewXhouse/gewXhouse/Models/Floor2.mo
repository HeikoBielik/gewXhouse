within gewXhouse.Models;

model Floor2
  /******************** Parameters ********************/
  parameter Real rho = 0.001 "g/cm3";
  parameter Real c = 8 "1.26 W/m2.K Humus";
  parameter Real c_p=1000 "J/Kg*K spezifische Wärmekapazität Gartenerde";
  parameter Real w = 0.1 "floor width";
  /******************** Initialization ********************/
  Real Q_flow "Heat flow rate from port_a -> port_b";
  Real T;
  Real C "J/K";
  /******************** Connectors ********************/
  Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_a heatPort "Heat port for sensible heat input" annotation(
    Placement(transformation(extent = {{-10, -10}, {10, 10}}), iconTransformation(extent = {{-10, -10}, {10, 10}})));
  input Connectors.Interfaces.HeatFluxInput I_Intern annotation(
    Placement(visible = true, transformation(origin = {-58, 46}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-40, 30}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Blocks.Interfaces.RealInput surface "Ground floor" annotation(
    Placement(visible = true, transformation(origin = {-120, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-40, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
equation
  Q_flow = I_Intern * surface; //raiation
  
  heatPort.Q_flow = c * surface * (T - heatPort.T); //flow air / floor
  
  C = rho * surface * w * c_p; //cpacity floor
  
  der(T) = (Q_flow-heatPort.Q_flow) / C; 
  
  annotation(
    Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics),
    Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics = {Rectangle(extent = {{-20, 80}, {20, -80}}, lineColor = {0, 0, 0}, fillColor = {192, 192, 192}, fillPattern = FillPattern.Backward, origin = {0, 0}, rotation = 90), Text(extent = {{-100, -34}, {120, -94}}, lineColor = {0, 0, 0}, textString = "%name")}));
end Floor2;
