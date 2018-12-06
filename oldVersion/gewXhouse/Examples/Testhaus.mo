within gewXhouse.Examples;

model Testhaus
  gewXhouse.Models.Musterhaus musterhaus1 annotation(
    Placement(visible = true, transformation(origin = {-2, 2}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Models.Sun sun annotation(
    Placement(visible = true, transformation(origin = {-36, 2}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(sun.I_glob, musterhaus1.I) annotation(
    Line(points = {{-24, 2}, {-14, 2}, {-14, 2}, {-12, 2}}, color = {255, 207, 14}));
  connect(musterhaus1.sunPos, sun.sunPos) annotation(
    Line(points = {{-12, 6}, {-26, 6}, {-26, 6}, {-24, 6}}, color = {0, 0, 127}, thickness = 0.5));
  annotation(
    Diagram(coordinateSystem(initialScale = 0.1)),
    experiment(StartTime = 0, StopTime = 86400, Tolerance = 1e-06, Interval = 86.5731));
end Testhaus;
