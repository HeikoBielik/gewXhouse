within gewXhouse.Tests;

model sun
  gewXhouse.Models.Sun sun annotation(
    Placement(visible = true, transformation(origin = {-38, -6}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression realExpression2(y = 48.8785888)  annotation(
    Placement(visible = true, transformation(origin = {10, -10}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression realExpression1(y = 8.717279) annotation(
    Placement(visible = true, transformation(origin = {10, 10}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
equation
  connect(realExpression2.y, sun.posHouse[2]) annotation(
    Line(points = {{0, -10}, {-26, -10}, {-26, -10}, {-26, -10}}, color = {0, 0, 127}));
  connect(realExpression1.y, sun.posHouse[1]) annotation(
    Line(points = {{0, 10}, {-14, 10}, {-14, -10}, {-26, -10}, {-26, -10}}, color = {0, 0, 127}));

annotation(
    experiment(StartTime = 0, StopTime = 86400, Tolerance = 1e-06, Interval = 86.5731));end sun;
