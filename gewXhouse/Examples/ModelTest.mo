within gewXhouse.Examples;

model ModelTest
  Modelica.Blocks.Sources.RealExpression realExpression1(y = 2000) annotation(
    Placement(visible = true, transformation(origin = {-54, -16}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression realExpression3(y = 30) annotation(
    Placement(visible = true, transformation(origin = {-54, 4}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Models.Radiation radiation1 annotation(
    Placement(visible = true, transformation(origin = {-18, -16}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Thermal.HeatTransfer.Components.Convection convection1 annotation(
    Placement(visible = true, transformation(origin = {14, -16}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression realExpression2(y = 0.76) annotation(
    Placement(visible = true, transformation(origin = {-14, 22}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Thermal.HeatTransfer.Components.HeatCapacitor heatCapacitor1(C = 10000, T(start = 313.15)) annotation(
    Placement(visible = true, transformation(origin = {68, 22}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(heatCapacitor1.port, convection1.fluid) annotation(
    Line(points = {{68, 12}, {68, 12}, {68, -16}, {24, -16}, {24, -16}}, color = {191, 0, 0}));
  connect(convection1.Gc, realExpression2.y) annotation(
    Line(points = {{14, -6}, {14, -6}, {14, 22}, {-2, 22}, {-2, 22}}, color = {0, 0, 127}));
  connect(radiation1.port, convection1.solid) annotation(
    Line(points = {{-8, -16}, {4, -16}, {4, -16}, {4, -16}}, color = {191, 0, 0}));
  connect(realExpression3.y, radiation1.S) annotation(
    Line(points = {{-42, 4}, {-34, 4}, {-34, -10}, {-20, -10}, {-20, -10}}, color = {0, 0, 127}));
  connect(radiation1.I, realExpression1.y) annotation(
    Line(points = {{-20, -16}, {-43, -16}}, color = {0, 0, 127}));
  annotation(
    experiment(StartTime = 0, StopTime = 60, Tolerance = 1e-06, Interval = 0.12));
end ModelTest;
