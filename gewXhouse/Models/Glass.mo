within gewXhouse.Models;

model Glass
  gewXhouse.Models.ThermalConductor glass1 annotation(
    Placement(visible = true, transformation(origin = {0, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression l_glass(y = 0.76) annotation(
    Placement(visible = true, transformation(origin = {-54, -34}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  gewXhouse.Models.ThermalConductor gas annotation(
    Placement(visible = true, transformation(origin = {30, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  gewXhouse.Models.ThermalConductor glass2 annotation(
    Placement(visible = true, transformation(origin = {60, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression l_gas(y = 26e-3) annotation(
    Placement(visible = true, transformation(origin = {-20, -68}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Product product1 annotation(
    Placement(visible = true, transformation(origin = {-16, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Division division1 annotation(
    Placement(visible = true, transformation(origin = {-54, -54}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression s(y = 27) annotation(
    Placement(visible = true, transformation(origin = {-90, -38}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression w_glass(y = 3e-3) annotation(
    Placement(visible = true, transformation(origin = {-90, -60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Product product2 annotation(
    Placement(visible = true, transformation(origin = {10, -74}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression w_gas(y = 12e-3) annotation(
    Placement(visible = true, transformation(origin = {-90, -86}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Division division2 annotation(
    Placement(visible = true, transformation(origin = {-54, -80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_a port_inner annotation(
    Placement(visible = true, transformation(origin = {-28, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-110, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_a port_outer annotation(
    Placement(visible = true, transformation(origin = {90, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {110, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(product2.u2, division2.y) annotation(
    Line(points = {{-2, -80}, {-42, -80}}, color = {0, 0, 127}));
  connect(product2.y, gas.G) annotation(
    Line(points = {{21, -74}, {30, -74}, {30, -18}}, color = {0, 0, 127}));
  connect(l_gas.y, product2.u1) annotation(
    Line(points = {{-9, -68}, {-2, -68}}, color = {0, 0, 127}));
  connect(glass2.port_b, port_outer) annotation(
    Line(points = {{70, -10}, {90, -10}, {90, -10}, {90, -10}}, color = {191, 0, 0}));
  connect(product1.y, glass2.G) annotation(
    Line(points = {{-4, -40}, {0, -40}, {0, -24}, {60, -24}, {60, -18}}, color = {0, 0, 127}));
  connect(gas.port_b, glass2.port_a) annotation(
    Line(points = {{40, -10}, {50, -10}}, color = {191, 0, 0}));
  connect(gas.port_a, glass1.port_b) annotation(
    Line(points = {{20, -10}, {10, -10}}, color = {191, 0, 0}));
  connect(glass1.port_a, port_inner) annotation(
    Line(points = {{-10, -10}, {-28, -10}, {-28, -10}, {-28, -10}}, color = {191, 0, 0}));
  connect(l_glass.y, product1.u1) annotation(
    Line(points = {{-43, -34}, {-28, -34}}, color = {0, 0, 127}));
  connect(division2.u2, w_gas.y) annotation(
    Line(points = {{-66, -86}, {-79, -86}}, color = {0, 0, 127}));
  connect(division2.u1, s.y) annotation(
    Line(points = {{-66, -74}, {-72, -74}, {-72, -38}, {-78, -38}}, color = {0, 0, 127}));
  connect(w_glass.y, division1.u2) annotation(
    Line(points = {{-79, -60}, {-66, -60}}, color = {0, 0, 127}));
  connect(division1.u1, s.y) annotation(
    Line(points = {{-66, -48}, {-72, -48}, {-72, -38}, {-79, -38}}, color = {0, 0, 127}));
  connect(division1.y, product1.u2) annotation(
    Line(points = {{-43, -54}, {-38, -54}, {-38, -46}, {-28, -46}}, color = {0, 0, 127}));
  connect(product1.y, glass1.G) annotation(
    Line(points = {{-4, -40}, {0, -40}, {0, -18}, {0, -18}}, color = {0, 0, 127}));
  annotation(
    experiment(StartTime = 0, StopTime = 7200, Tolerance = 1e-06, Interval = 14.4),
    Icon(graphics = {Rectangle(origin = {-21, 0}, fillColor = {170, 255, 255}, fillPattern = FillPattern.Solid, extent = {{-19, 80}, {61, -80}}), Rectangle(fillColor = {232, 255, 228}, fillPattern = FillPattern.Solid, extent = {{-20, 80}, {20, -80}}), Line(origin = {-3, 0}, points = {{-77, 0}, {83, 0}}, color = {170, 0, 0}, thickness = 0.5, arrow = {Arrow.Filled, Arrow.Filled}, arrowSize = 10)}, coordinateSystem(initialScale = 0.1)),
  Documentation(info = "<html><head></head><body>The glass model simulates a is able to simulate a double glazing (glass 1 and glass 2) &nbsp;model with a gas between it.&nbsp;This model includs different modelica standard blocks e.g.&nbsp;<a href=\"modelica://Modelica.Blocks.Math.Product\">product</a>,&nbsp;<a href=\"modelica://Modelica.Thermal.HeatTransfer.Components.HeatCapacitor\" style=\"font-size: 12px;\">heat capacity</a>,&nbsp;<a href=\"modelica://Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_a\" style=\"font-size: 12px;\">heat port</a>, which were adapted to the greenhouse.The user able to in the  <a href=\"modelica://gewXhouse.Models.House\">house</a> model glass width or the gas gap with desired material.&nbsp;<div><br></div></body></html>"));
end Glass;
