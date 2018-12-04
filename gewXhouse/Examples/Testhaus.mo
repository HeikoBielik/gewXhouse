within gewXhouse.Examples;

model Testhaus
  gewXhouse.Models.Musterhaus musterhaus1 annotation(
    Placement(visible = true, transformation(origin = {-2, 2}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  gewXhouse.Models.Sun sun annotation(
    Placement(visible = true, transformation(origin = {-34, 2}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  gewXhouse.Models.Environment environment(filePath = "C:/Users/m.jilg.LOCCIONI/Documents/GitHub/gewXhouse/temp.txt")  annotation(
    Placement(visible = true, transformation(origin = {26, 0}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
equation
  connect(sun.posHouse, musterhaus1.posHouse) annotation(
    Line(points = {{-23, -2}, {-12, -2}}, color = {0, 0, 127}, thickness = 0.5));
  connect(sun.I_glob, musterhaus1.I) annotation(
    Line(points = {{-23, 2}, {-12, 2}}, color = {255, 207, 14}));
  connect(sun.sunPos, musterhaus1.sunPos) annotation(
    Line(points = {{-23, 6}, {-13, 6}}, color = {0, 0, 127}, thickness = 0.5));
  connect(musterhaus1.environment_floor, environment.floor) annotation(
    Line(points = {{10, -4}, {14, -4}, {14, -2}, {18, -2}, {18, -2}}, color = {191, 0, 0}));
  connect(musterhaus1.environment_air, environment.air) annotation(
    Line(points = {{10, 2}, {18, 2}, {18, 2}, {18, 2}}, color = {191, 0, 0}));
  annotation(
    Diagram(coordinateSystem(initialScale = 0.1)),
    experiment(StartTime = 0, StopTime = 86400, Tolerance = 1e-06, Interval = 86.5731));
end Testhaus;
