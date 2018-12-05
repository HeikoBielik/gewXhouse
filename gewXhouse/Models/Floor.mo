within gewXhouse.Models;

model Floor
  parameter Modelica.Blocks.Sources.RealExpression w(y=1) "m floor width (1)" annotation(
    Placement(visible = true, transformation(origin = {-88, 62}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  parameter Modelica.Blocks.Sources.RealExpression s(y=9) "m2 surface ground floor (9)" annotation(
  Placement(visible = true, transformation(origin = {-56, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  parameter Modelica.Blocks.Sources.RealExpression c(y=1.26) "W/m.K heat transfer coefficient (Humus: 1.26)" annotation(
    Placement(visible = true, transformation(origin = {-16, -34}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  parameter Modelica.Blocks.Sources.RealExpression rho(y=1014.42) "kg/m3 density (Humus: 1014.42" annotation(
    Placement(visible = true, transformation(origin = {-22, 22}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  parameter Modelica.Blocks.Sources.RealExpression c_p(y=1000) "J/Kg.K specific thermal capacity (1000)" annotation(
    Placement(visible = true, transformation(origin = {-22, 36}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  parameter Modelica.Blocks.Sources.RealExpression g(y = 12) annotation(
    Placement(visible = true, transformation(origin = {-50, -84}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  
  parameter Modelica.SIunits.Temperature T_start=298 annotation(Dialog(tab = "Initialization"));
  
public
  gewXhouse.Connectors.Interfaces.HeatFluxInput I "heat flux" annotation(
    Placement(visible = true, transformation(origin = {-24, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-40, 30}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  
  gewXhouse.Models.Radiation radiation annotation(
    Placement(visible = true, transformation(origin = {12, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  gewXhouse.Models.HeatCapacitor heatCapacitor annotation(
    Placement(visible = true, transformation(origin = {44, 40}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  gewXhouse.Models.ThermalConductor thermalConductor annotation(
    Placement(visible = true, transformation(origin = {62, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Product product annotation(
    Placement(visible = true, transformation(origin = {-2, 56}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Product product1 annotation(
    Placement(visible = true, transformation(origin = {28, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Division division annotation(
    Placement(visible = true, transformation(origin = {-16, -56}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_a heatPort(T(start=T_start)) "Heat port for sensible heat input" annotation(
    Placement(visible = true,transformation(extent = {{80, -20}, {100, 0}}, rotation = 0), iconTransformation(extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_a environment annotation(
    Placement(visible = true, transformation(extent = {{80, -80}, {100, -60}}, rotation = 0), iconTransformation(extent = {{-50, -40}, {-30, -20}}, rotation = 0)));
  gewXhouse.Models.ThermalConductor thermalConductor1 annotation(
    Placement(visible = true, transformation(origin = {62, -70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Product product2 annotation(
    Placement(visible = true, transformation(origin = {28, -84}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Product product3 annotation(
    Placement(visible = true, transformation(origin = {-16, -90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));

equation
  if cardinality(I) == 0 then
    I = 6000;
  end if;
  connect(product3.u2, w.y) annotation(
    Line(points = {{-28, -96}, {-70, -96}, {-70, 62}, {-78, 62}, {-78, 62}, {-76, 62}}, color = {0, 0, 127}));
  connect(product3.y, product2.u2) annotation(
    Line(points = {{-4, -90}, {16, -90}, {16, -90}, {16, -90}}, color = {0, 0, 127}));
  connect(g.y, product3.u1) annotation(
    Line(points = {{-38, -84}, {-30, -84}, {-30, -84}, {-28, -84}}, color = {0, 0, 127}));
  connect(product2.u1, c.y) annotation(
    Line(points = {{16, -78}, {8, -78}, {8, -34}, {-4, -34}, {-4, -34}}, color = {0, 0, 127}));
  connect(product2.y, thermalConductor1.G) annotation(
    Line(points = {{39, -84}, {62, -84}, {62, -78}}, color = {0, 0, 127}));
  connect(division.y, product1.u2) annotation(
    Line(points = {{-5, -56}, {2, -56}, {2, -46}, {16, -46}}, color = {0, 0, 127}));
  connect(division.u1, s.y) annotation(
    Line(points = {{-28, -50}, {-36, -50}, {-36, 50}, {-56, 50}}, color = {0, 0, 127}));
  connect(division.u2, w.y) annotation(
    Line(points = {{-28, -62}, {-70, -62}, {-70, 62}, {-76, 62}}, color = {0, 0, 127}));
  connect(product1.y, thermalConductor.G) annotation(
    Line(points = {{39, -40}, {62, -40}, {62, -18}}, color = {0, 0, 127}));
  connect(c.y, product1.u1) annotation(
    Line(points = {{-5, -34}, {16, -34}}, color = {0, 0, 127}));
  connect(environment, thermalConductor1.port_b) annotation(
    Line(points = {{90, -70}, {72, -70}}, color = {191, 0, 0}));
  connect(thermalConductor1.port_a, thermalConductor.port_a) annotation(
    Line(points = {{52, -70}, {44, -70}, {44, -10}, {52, -10}}, color = {191, 0, 0}));
  connect(w.y, product.u1) annotation(
    Line(points = {{-76, 62}, {-14, 62}, {-14, 62}, {-14, 62}}, color = {0, 0, 127}));
  connect(radiation.S, s.y) annotation(
    Line(points = {{9, -4}, {-7.8, -4}, {-7.8, 6}, {-35.8, 6}, {-35.8, 50}, {-56, 50}}, color = {0, 0, 127}));
  connect(product.u2, s.y) annotation(
    Line(points = {{-14, 50}, {-56, 50}}, color = {0, 0, 127}));
  connect(I, radiation.I) annotation(
    Line(points = {{-24, -10}, {8, -10}, {8, -10}, {10, -10}}, color = {255, 207, 14}));
  connect(radiation.port, thermalConductor.port_a) annotation(
    Line(points = {{22, -10}, {52, -10}}, color = {191, 0, 0}));
  connect(heatCapacitor.volume, product.y) annotation(
    Line(points = {{28, 44}, {20, 44}, {20, 56}, {9, 56}}, color = {0, 0, 127}));
  connect(thermalConductor.port_a, heatCapacitor.port) annotation(
    Line(points = {{52, -10}, {44, -10}, {44, 20}}, color = {191, 0, 0}));
  connect(thermalConductor.port_b, heatPort) annotation(
    Line(points = {{72, -10}, {90, -10}}, color = {191, 0, 0}));
  connect(rho.y, heatCapacitor.rho) annotation(
    Line(points = {{-22, 22}, {8, 22}, {8, 28}, {28, 28}}, color = {0, 0, 127}));
  connect(c_p.y, heatCapacitor.c_p) annotation(
    Line(points = {{-22, 36}, {28, 36}}, color = {0, 0, 127}));

  annotation(
    Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics),
    Icon(coordinateSystem(preserveAspectRatio = false, initialScale = 0.1), graphics = {Rectangle(rotation = 90, fillColor = {170, 85, 0}, fillPattern = FillPattern.Backward, extent = {{-20, 80}, {20, -80}}), Text(extent = {{-100, -34}, {120, -94}}, textString = "%name")}),
  experiment(StartTime = 0, StopTime = 86400, Tolerance = 1e-06, Interval = 86.5731));
end Floor;
