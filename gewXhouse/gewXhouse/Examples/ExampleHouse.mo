within gewXhouse.Examples;

model ExampleHouse
  gewXhouse.Models.Sun sun annotation(
    Placement(visible = true, transformation(origin = {-92, 90}, extent = {{-56, -56}, {56, 56}}, rotation = 0)));
  gewXhouse.Models.Greenhouse.Greenhouse greenhouse annotation(
    Placement(visible = true, transformation(origin = {-1, 7}, extent = {{-55, -55}, {55, 55}}, rotation = 0)));
  gewXhouse.Models.Environment environment annotation(
    Placement(visible = true, transformation(origin = {0, 0}, extent = {{-98, -98}, {98, 98}}, rotation = 0)));
equation
  connect(environment.environment, greenhouse.environment) annotation(
    Line(points = {{78, 2}, {44, 2}, {44, 0}}));
  connect(sun.Radiation, greenhouse.Radiation) annotation(
    Line(points = {{-37, 59}, {-48, 59}, {-48, 26}}, color = {87, 87, 87}));
  annotation(
    experiment(StartTime = 0, StopTime = 86400, Tolerance = 1e-06, Interval = 78.6885));
end ExampleHouse;
