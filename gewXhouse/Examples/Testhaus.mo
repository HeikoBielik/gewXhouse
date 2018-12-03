within gewXhouse.Examples;

model Testhaus
  gewXhouse.Models.Musterhaus musterhaus1 annotation(
    Placement(visible = true, transformation(origin = {-34, 2}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  gewXhouse.Models.Sun sun annotation(
    Placement(visible = true, transformation(origin = {-64, 2}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression realExpression1(y = 1000)  annotation(
    Placement(visible = true, transformation(origin = {-58, -18}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(realExpression1.y, musterhaus1.I) annotation(
    Line(points = {{-46, -18}, {-44, -18}, {-44, -6}, {-50, -6}, {-50, 2}, {-46, 2}, {-46, 2}}, color = {0, 0, 127}));
  connect(sun.sunPos, musterhaus1.sunPos) annotation(
    Line(points = {{-52, 6}, {-46, 6}, {-46, 6}, {-46, 6}}, color = {0, 0, 127}, thickness = 0.5));
  connect(sun.posHouse, musterhaus1.posHouse) annotation(
    Line(points = {{-52, -2}, {-46, -2}, {-46, -2}, {-46, -2}, {-46, -2}}, color = {0, 0, 127}, thickness = 0.5));
  annotation(
    Diagram(coordinateSystem(initialScale = 0.1)),
    experiment(StartTime = 0, StopTime = 86400, Tolerance = 1e-06, Interval = 86.5731));
end Testhaus;
