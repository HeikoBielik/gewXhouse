within gewXhouse.Models;

model Floor
  parameter Modelica.Blocks.Interfaces.RealInput w = 1 "m floor width" annotation(
    Placement(visible = true, transformation(origin = {-70, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-90, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  parameter Modelica.Blocks.Interfaces.RealInput c = 8 "1.26 W/m2.K Humus" annotation(
    Placement(visible = true, transformation(origin = {-70, -34}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-90, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  parameter Modelica.Blocks.Interfaces.RealInput rho = 1014.42 "kg/m3 density" annotation(
    Placement(visible = true, transformation(origin = {-70, 22}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-90, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  parameter Modelica.Blocks.Interfaces.RealInput c_p = 1000 "J/Kg.K specific thermal capacity" annotation(
    Placement(visible = true, transformation(origin = {-70, 36}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-90, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  parameter Connectors.Interfaces.HeatFluxInput I_Intern = 1000 "J/m2" annotation(
  Placement(visible = true, transformation(origin = {-70, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-40, 30}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  parameter Modelica.Blocks.Interfaces.RealInput surface = 15 "m2 Ground floor" annotation(
  Placement(visible = true, transformation(origin = {-96, 62}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-40, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));

  /******************** Parameters ********************/
  //parameter Modelica.SIunits.Density rho = 0.001 "g/cm3";
  //parameter Modelica.SIunits.SurfaceCoefficientOfHeatTransfer c = 8 "1.26 W/m2.K Humus";
  //parameter Modelica.SIunits.SpecificHeatCapacityAtConstantPressure c_p=1000 "J/Kg*K spezifische Wärmekapazität Gartenerde";
  //parameter Modelica.SIunits.Length w = 0.1 "floor width";
  /******************** Initialization ********************/
  /*Modelica.SIunits.HeatFlowRate Q_flow "Heat flow rate from port_a -> port_b";
  Modelica.SIunits.Temp_C T (start = 20) "°C";
  Modelica.SIunits.HeatCapacity C "J/K";*/
  /******************** Connectors ********************/
  Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_a heatPort "Heat port for sensible heat input" annotation(
    Placement(visible = true,transformation(extent = {{60, -20}, {80, 0}}, rotation = 0), iconTransformation(extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  gewXhouse.Models.HeatCapacitor heatCapacitor(T(start = 293.15))  annotation(
    Placement(visible = true, transformation(origin = {0, 40}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  gewXhouse.Models.ThermalConductor thermalConductor annotation(
    Placement(visible = true, transformation(origin = {30, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  gewXhouse.Models.Radiation radiation annotation(
    Placement(visible = true, transformation(origin = {-30, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Product product annotation(
    Placement(visible = true, transformation(origin = {-40, 56}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Product product1 annotation(
    Placement(visible = true, transformation(origin = {-30, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(heatCapacitor.volume, product.y) annotation(
    Line(points = {{-16, 44}, {-24, 44}, {-24, 56}, {-29, 56}}, color = {0, 0, 127}));
  connect(w, product.u2) annotation(
    Line(points = {{-70, 50}, {-52, 50}}, color = {0, 0, 127}));
  connect(product.u1, surface) annotation(
    Line(points = {{-52, 62}, {-96, 62}}, color = {0, 0, 127}));
  connect(thermalConductor.port_b, heatPort) annotation(
    Line(points = {{40, -10}, {66, -10}, {66, -10}, {70, -10}}, color = {191, 0, 0}));
  connect(heatCapacitor.port, thermalConductor.port_a) annotation(
    Line(points = {{0, 20}, {0, 20}, {0, -10}, {20, -10}, {20, -10}}, color = {191, 0, 0}));
  connect(radiation.port, thermalConductor.port_a) annotation(
    Line(points = {{-20, -10}, {20, -10}, {20, -10}, {20, -10}}, color = {191, 0, 0}));
  connect(product1.y, thermalConductor.G) annotation(
    Line(points = {{-19, -40}, {30, -40}, {30, -18}}, color = {0, 0, 127}));
  connect(heatCapacitor.rho, rho) annotation(
    Line(points = {{-16, 28}, {-40, 28}, {-40, 22}, {-62, 22}, {-62, 22}, {-70, 22}}, color = {0, 0, 127}));
  connect(I_Intern, radiation.I) annotation(
    Line(points = {{-70, -10}, {-33, -10}}, color = {255, 207, 14}));
  connect(c, product1.u1) annotation(
    Line(points = {{-70, -34}, {-42, -34}}, color = {0, 0, 127}));
  connect(product1.u2, surface) annotation(
    Line(points = {{-42, -46}, {-78, -46}, {-78, 62}, {-96, 62}}, color = {0, 0, 127}));
  connect(radiation.S, surface) annotation(
    Line(points = {{-32, -18}, {-78, -18}, {-78, 62}, {-88, 62}, {-88, 62}, {-96, 62}}, color = {0, 0, 127}));
  connect(c_p, heatCapacitor.c_p) annotation(
    Line(points = {{-70, 36}, {-16, 36}}, color = {0, 0, 127}));
  /*Q_flow = I_Intern * surface; //raiation
  
  heatPort.Q_flow = c * surface * (T - heatPort.T); //flow air / floor
  
  C = rho * surface * w * c_p; //cpacity floor
  
  der(T) = (Q_flow-heatPort.Q_flow) / C; 
  */
  annotation(
    Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics),
    Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics = {Rectangle(extent = {{-20, 80}, {20, -80}}, lineColor = {0, 0, 0}, fillColor = {192, 192, 192}, fillPattern = FillPattern.Backward, origin = {0, 0}, rotation = 90), Text(extent = {{-100, -34}, {120, -94}}, lineColor = {0, 0, 0}, textString = "%name")}),
  experiment(StartTime = 0, StopTime = 86400, Tolerance = 1e-06, Interval = 86.5731));
end Floor;
