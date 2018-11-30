within gewXhouse.Models;

model Floor
  parameter Modelica.Blocks.Interfaces.RealInput w = 1 "m floor width" annotation(
    Placement(visible = true, transformation(origin = {-90, 62}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-90, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  parameter Modelica.Blocks.Interfaces.RealInput surface = 9 "m2 Ground floor" annotation(
  Placement(visible = true, transformation(origin = {-70, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-40, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  parameter Modelica.Blocks.Interfaces.RealInput c = 1.26 "W/m.K Humus" annotation(
    Placement(visible = true, transformation(origin = {-50, -44}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-90, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  parameter Modelica.Blocks.Interfaces.RealInput rho = 1014.42 "kg/m3 density" annotation(
    Placement(visible = true, transformation(origin = {-50, 22}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-90, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  parameter Modelica.Blocks.Interfaces.RealInput c_p = 1000 "J/Kg.K specific thermal capacity" annotation(
    Placement(visible = true, transformation(origin = {-50, 36}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-90, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));

  Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_a heatPort "Heat port for sensible heat input" annotation(
    Placement(visible = true,transformation(extent = {{80, -20}, {100, 0}}, rotation = 0), iconTransformation(extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  gewXhouse.Models.HeatCapacitor heatCapacitor annotation(
    Placement(visible = true, transformation(origin = {20, 40}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  gewXhouse.Models.ThermalConductor thermalConductor annotation(
    Placement(visible = true, transformation(origin = {50, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Product product annotation(
    Placement(visible = true, transformation(origin = {-26, 56}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Product product1 annotation(
    Placement(visible = true, transformation(origin = {20, -50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  gewXhouse.Models.Radiation radiation annotation(
    Placement(visible = true, transformation(origin = {-14, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  gewXhouse.Connectors.Interfaces.HeatFluxInput I annotation(
    Placement(visible = true, transformation(origin = {-50, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-40, 30}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Blocks.Math.Division division annotation(
    Placement(visible = true, transformation(origin = {-24, -66}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(product.u1, w) annotation(
    Line(points = {{-38, 62}, {-90, 62}}, color = {0, 0, 127}));
  connect(product.u2, surface) annotation(
    Line(points = {{-38, 50}, {-70, 50}}, color = {0, 0, 127}));
  connect(heatCapacitor.volume, product.y) annotation(
    Line(points = {{4, 44}, {-4, 44}, {-4, 56}, {-15, 56}}, color = {0, 0, 127}));
  connect(division.y, product1.u2) annotation(
    Line(points = {{-13, -66}, {-6, -66}, {-6, -56}, {8, -56}}, color = {0, 0, 127}));
  connect(division.u2, w) annotation(
    Line(points = {{-36, -72}, {-76, -72}, {-76, 62}, {-90, 62}}, color = {0, 0, 127}));
  connect(division.u1, surface) annotation(
    Line(points = {{-36, -60}, {-58, -60}, {-58, 50}, {-70, 50}}, color = {0, 0, 127}));
  connect(radiation.port, thermalConductor.port_a) annotation(
    Line(points = {{-4, -10}, {40, -10}, {40, -10}, {40, -10}}, color = {191, 0, 0}));
  connect(I, radiation.I) annotation(
    Line(points = {{-50, -10}, {-18, -10}, {-18, -10}, {-16, -10}}, color = {255, 207, 14}));
  connect(radiation.S, surface) annotation(
    Line(points = {{-16.8, -4}, {-33.8, -4}, {-33.8, 6}, {-57.8, 6}, {-57.8, 50}, {-69.8, 50}}, color = {0, 0, 127}));
  connect(c, product1.u1) annotation(
    Line(points = {{-50, -44}, {8, -44}}, color = {0, 0, 127}));
  connect(product1.y, thermalConductor.G) annotation(
    Line(points = {{31, -50}, {50, -50}, {50, -34}, {50, -34}, {50, -18}}, color = {0, 0, 127}));
  connect(thermalConductor.port_b, heatPort) annotation(
    Line(points = {{60, -10}, {86, -10}, {86, -10}, {90, -10}}, color = {191, 0, 0}));
  connect(thermalConductor.port_a, heatCapacitor.port) annotation(
    Line(points = {{40, -10}, {20, -10}, {20, 20}, {20, 20}, {20, 20}}, color = {191, 0, 0}));
  connect(c_p, heatCapacitor.c_p) annotation(
    Line(points = {{-50, 36}, {4, 36}}, color = {0, 0, 127}));
  connect(rho, heatCapacitor.rho) annotation(
    Line(points = {{-50, 22}, {-16, 22}, {-16, 28}, {4, 28}, {4, 28}, {4, 28}, {4, 28}, {4, 28}, {4, 28}}, color = {0, 0, 127}));
  annotation(
    Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics),
    Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics = {Rectangle(extent = {{-20, 80}, {20, -80}}, lineColor = {0, 0, 0}, fillColor = {192, 192, 192}, fillPattern = FillPattern.Backward, origin = {0, 0}, rotation = 90), Text(extent = {{-100, -34}, {120, -94}}, lineColor = {0, 0, 0}, textString = "%name")}),
  experiment(StartTime = 0, StopTime = 86400, Tolerance = 1e-06, Interval = 86.5731));
end Floor;
