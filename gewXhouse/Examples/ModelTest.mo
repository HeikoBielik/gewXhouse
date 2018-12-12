within gewXhouse.Examples;

model ModelTest
  gewXhouse.Models.ThermalConductor glass1 annotation(
    Placement(visible = true, transformation(origin = {0, -32}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression l_glass(y = 0.76) annotation(
    Placement(visible = true, transformation(origin = {-92, -6}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  gewXhouse.Models.ThermalConductor gas annotation(
    Placement(visible = true, transformation(origin = {32, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  gewXhouse.Models.ThermalConductor glass2 annotation(
    Placement(visible = true, transformation(origin = {50, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression l_gas(y = 26e-3) annotation(
    Placement(visible = true, transformation(origin = {-20, -68}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Division division1 annotation(
    Placement(visible = true, transformation(origin = {-42, -48}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression s_plant(y = 27) annotation(
    Placement(visible = true, transformation(origin = {-90, 56}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression w_glass(y = 3e-3) annotation(
    Placement(visible = true, transformation(origin = {-90, -60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Product product2 annotation(
    Placement(visible = true, transformation(origin = {10, -74}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression w_gas(y = 12e-3) annotation(
    Placement(visible = true, transformation(origin = {-90, -86}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Division division2 annotation(
    Placement(visible = true, transformation(origin = {-54, -80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_a port_inner annotation(
    Placement(visible = true, transformation(origin = {90, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-110, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  gewXhouse.Models.Radiation radiation1 annotation(
    Placement(visible = true, transformation(origin = {10, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression I(y = 27) annotation(
    Placement(visible = true, transformation(origin = {-50, 14}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Feedback feedback1 annotation(
    Placement(visible = true, transformation(origin = {-30, 80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Gain gain1(k = 0.87)  annotation(
    Placement(visible = true, transformation(origin = {-14, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Gain gain2(k = 0.05)  annotation(
    Placement(visible = true, transformation(origin = {-14, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression s_total(y = 27) annotation(
    Placement(visible = true, transformation(origin = {-70, 80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  gewXhouse.Models.HeatCapacitor heatCapacitor1 annotation(
    Placement(visible = true, transformation(origin = {30, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression v(y = 27) annotation(
    Placement(visible = true, transformation(origin = {-2, 112}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression c_p(y = 27) annotation(
    Placement(visible = true, transformation(origin = {-2, 98}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression roh(y = 27) annotation(
    Placement(visible = true, transformation(origin = {-2, 84}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(division1.u1, s_plant.y) annotation(
    Line(points = {{-54, -42}, {-68, -42}, {-68, 56}, {-78, 56}, {-78, 56}}, color = {0, 0, 127}));
  connect(w_glass.y, division1.u2) annotation(
    Line(points = {{-79, -60}, {-72.5, -60}, {-72.5, -54}, {-54, -54}}, color = {0, 0, 127}));
  connect(gain2.u, I.y) annotation(
    Line(points = {{-26, 0}, {-36, 0}, {-36, 14}, {-39, 14}}, color = {0, 0, 127}));
  connect(gain1.y, radiation1.I) annotation(
    Line(points = {{-3, 30}, {1, 30}, {1, 50}, {7, 50}}, color = {0, 0, 127}));
  connect(gain1.u, I.y) annotation(
    Line(points = {{-26, 30}, {-36, 30}, {-36, 14}, {-39, 14}}, color = {0, 0, 127}));
  connect(heatCapacitor1.port, radiation1.port) annotation(
    Line(points = {{30, 80}, {30, 50}, {20, 50}}, color = {191, 0, 0}));
  connect(s_plant.y, radiation1.S) annotation(
    Line(points = {{-79, 56}, {7, 56}}, color = {0, 0, 127}));
  connect(feedback1.u2, s_plant.y) annotation(
    Line(points = {{-30, 72}, {-30, 56}, {-79, 56}}, color = {0, 0, 127}));
  connect(port_inner, glass2.port_b) annotation(
    Line(points = {{90, 50}, {60, 50}}, color = {191, 0, 0}));
  connect(glass2.port_a, heatCapacitor1.port) annotation(
    Line(points = {{40, 50}, {30, 50}, {30, 80}, {30, 80}}, color = {191, 0, 0}));
  connect(v.y, heatCapacitor1.volume) annotation(
    Line(points = {{10, 112}, {16, 112}, {16, 92}, {22, 92}, {22, 92}}, color = {0, 0, 127}));
  connect(c_p.y, heatCapacitor1.c_p) annotation(
    Line(points = {{10, 98}, {12, 98}, {12, 88}, {22, 88}, {22, 88}}, color = {0, 0, 127}));
  connect(roh.y, heatCapacitor1.rho) annotation(
    Line(points = {{10, 84}, {22, 84}, {22, 84}, {22, 84}}, color = {0, 0, 127}));
  connect(feedback1.u1, s_total.y) annotation(
    Line(points = {{-38, 80}, {-58, 80}}, color = {0, 0, 127}));
  connect(gas.port_a, glass1.port_b) annotation(
    Line(points = {{22, -30}, {15, -30}, {15, -32}, {10, -32}}, color = {191, 0, 0}));
  connect(product2.y, gas.G) annotation(
    Line(points = {{21, -74}, {32, -74}, {32, -38}}, color = {0, 0, 127}));
  connect(product2.u2, division2.y) annotation(
    Line(points = {{-2, -80}, {-42, -80}}, color = {0, 0, 127}));
  connect(l_gas.y, product2.u1) annotation(
    Line(points = {{-9, -68}, {-2, -68}}, color = {0, 0, 127}));
  connect(division2.u2, w_gas.y) annotation(
    Line(points = {{-66, -86}, {-79, -86}}, color = {0, 0, 127}));
  annotation(
    experiment(StartTime = 0, StopTime = 7200, Tolerance = 1e-06, Interval = 14.4),
    Icon(graphics = {Rectangle(origin = {-21, 0}, fillColor = {170, 255, 255}, fillPattern = FillPattern.Solid, extent = {{-19, 80}, {61, -80}}), Rectangle(fillColor = {232, 255, 228}, fillPattern = FillPattern.Solid, extent = {{-20, 80}, {20, -80}}), Line(origin = {-3, 0}, points = {{-77, 0}, {83, 0}}, color = {170, 0, 0}, thickness = 0.5, arrow = {Arrow.None, Arrow.Filled}, arrowSize = 10)}));
end ModelTest;
